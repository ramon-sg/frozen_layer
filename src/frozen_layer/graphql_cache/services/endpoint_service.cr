module FrozenLayer
  module GraphqlCache
    struct Params
      getter operation_name : String?
      getter variables : Hash(String, JSON::Any)?
      getter query : String?
      getter headers : HTTP::Headers?
      getter body : String

      def initialize(
        @operation_name,
        @query,
        @variables,
        @headers,
        @body,
      )
      end
    end

    struct Result
      getter status : Int32
      getter body : String?
      getter headers : HTTP::Headers?
      getter? cache : Bool = false

      def initialize(
        @status = 200,
        @body = nil,
        @headers = nil,
        @cache = false,
      )
      end
    end

    class EndpointService
      def perform(body : String?, headers : HTTP::Headers?) : Result
        error, parsed_params = parse_params(body, headers)

        if error
          return Result.new(status: 400, body: error)
        end

        params = parsed_params.as(Params)

        operation = get_operation(params)
        return exec_query(params) if operation.nil? || !operation.enabled?

        graphql_params = build_graphql_params(params)
        graphql_hash = generate_hash(graphql_params)

        stored_response = Store.get(graphql_hash)

        return stored_result(stored_response) if stored_response

        exec_query(params).tap do |result|
          next if result.status != 200
          store_response(graphql_hash, result, operation.expiration)
        end
      end

      private def stored_result(body : String) : Result
        headers = HTTP::Headers{"Content-Type" => "application/json"}

        Result.new(body: body, headers: headers, cache: true)
      end

      private def parse_params(body : String?, headers : HTTP::Headers?) : {String, Nil} | {Nil, Params}
        return {"Request body is empty", nil} if body.nil?

        begin
          json = JSON.parse(body)
          query = json["query"]?.try(&.as_s)
          variables = json["variables"]?.try(&.as_h)
          operation_name = json["operationName"]?.try(&.as_s) || extract_operation_name(query)

          {nil, Params.new(operation_name, query, variables, headers, body)}
        rescue ex : JSON::Error
          return {ex.message, nil}
        end
      end

      private def get_operation(params : Params) : OperationMapItem?
        return nil if params.operation_name.nil? || params.query.nil?

        FrozenLayer.config.operations_map.try do |map|
          map[params.operation_name]?
        end
      end

      private def exec_query(params : Params, max_retries = 3) : Result
        retries = 0

        loop do
          begin
            response = graphql(params.headers, params.body)
            return Result.new(
              status: response.status_code,
              body: response.body,
              headers: response.headers,
            )
          rescue ex : HTTP::Server::ClientError | IO::Error
            log.error { "Exception: #{ex.inspect} - Retrying (#{retries}/#{max_retries})..." }

            retries += 1

            if retries >= max_retries
              return Result.new(
                status: 500,
                body: {"error": "Failed after #{max_retries} attempts: #{ex.message}"}.to_json
              )
            end

            sleep(0.1 * (2 ** retries)) # Exponential backoff
          end
        end
      end

      private def build_graphql_params(params : Params)
        {
          "query"          => params.query,
          "variables"      => params.variables,
          "operation_name" => params.operation_name,
        }
      end

      private def graphql(headers, body)
        HTTP::Client.post(
          url: FrozenLayer.config.graphql_url,
          headers: headers,
          body: body,
        )
      end

      private def store_response(hash : String, result : Result, expiration : Time::Span)
        spawn do
          Store.set(hash, result.body, expiration)
        end
      end

      private def log
        Log.for("GraphqlCache::EndpointService")
      end
    end
  end
end
