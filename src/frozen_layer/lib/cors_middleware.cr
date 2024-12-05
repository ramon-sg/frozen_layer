class CorsMiddleware
  include HTTP::Handler

  property cors_domain : String | Nil
  property cors_regex : Regex | Nil

  def initialize(@cors_domain : String = "*", cors_regex : String | Nil = nil)
    @cors_regex = parse_cors_regex(cors_regex)
  end

  private def parse_cors_regex(cors_regex : String | Nil) : Regex?
    begin
      cors_regex ? Regex.new(cors_regex) : nil
    rescue
      raise "Invalid cors regex: #{cors_regex}"
    end
  end

  def call(context : HTTP::Server::Context)
    origin = access_control_allow_origin(context)

    return call_next(context) if origin.nil?

    context.response.headers.add "Access-Control-Allow-Origin", origin

    context.response.headers.add "Vary", "Origin"
    context.response.headers.add "Access-Control-Allow-Credentials", "true"
    context.response.headers.add "Access-Control-Allow-Headers", "Content-Type,Authorization"

    if context.request.method == "OPTIONS"
      context.response.headers.add "Access-Control-Allow-Methods", "GET,POST,HEAD,PUT,DELETE,PATCH"

      return context.put_status(HTTP::Status::NO_CONTENT)
    end

    call_next(context)
  end

  def access_control_allow_origin(context : HTTP::Server::Context) : String?
    origin = context.request.headers["Origin"]?
    return cors_domain if origin.nil? || cors_regex.nil?

    origin.match(cors_regex.not_nil!) ? origin : cors_domain
  end
end
