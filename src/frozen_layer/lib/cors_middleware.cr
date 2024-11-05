class CorsMiddleware
  include HTTP::Handler

  property domain : String

  def initialize(@domain : String = "*")
  end

  def call(context : HTTP::Server::Context)
    context.response.headers.add "Access-Control-Allow-Origin", domain
    context.response.headers.add "Vary", "Origin"
    context.response.headers.add "Access-Control-Allow-Credentials", "true"
    context.response.headers.add "Access-Control-Allow-Headers", "Content-Type,Authorization"

    if context.request.method == "OPTIONS"
      context.response.headers.add "Access-Control-Allow-Methods", "GET,POST,HEAD,PUT,DELETE,PATCH"

      return context.put_status(HTTP::Status::NO_CONTENT)
    end

    call_next(context)
  end
end
