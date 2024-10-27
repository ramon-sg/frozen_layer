module FrozenLayer
  module GraphqlCache
    class EndpointController < FrozenLayer::BaseController
      def index(ctx : Context)
        request_body = ctx.request.body.try(&.gets_to_end)

        result = EndpointService.new.perform(request_body, ctx.request.headers)
        response_content_type = result.headers.try(&.["Content-Type"]?)

        ctx.exec do
          put_status(result.status)
          put_resp_header("Content-Type", response_content_type) if response_content_type
          put_resp_header("x-powered-by:", "Frozen Layer #{VERSION}")
          put_resp_header("x-Cache:", result.cache? ? "HIT" : "MISS")
          send_resp(result.body)
        end
      end
    end
  end
end
