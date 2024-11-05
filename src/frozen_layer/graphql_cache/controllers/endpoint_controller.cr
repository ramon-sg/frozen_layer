module FrozenLayer
  module GraphqlCache
    class EndpointController < FrozenLayer::BaseController
      def index(ctx : Context)
        request_body = ctx.request.body.try(&.gets_to_end)

        result = EndpointService.new.perform(request_body, ctx.request.headers)

        ctx.exec do
          put_status(result.status)

          result.headers.try do |headers|
            headers.each do |key, value|
              puts "key: #{key}, value: #{value}"
              put_resp_header(key, value)
            end
          end

          put_resp_header("x-powered-by:", "Frozen Layer #{VERSION}")
          put_resp_header("x-Cache:", result.cache? ? "HIT" : "MISS")
          send_resp(result.body)
        end
      end
    end
  end
end
