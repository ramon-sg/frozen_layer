module FrozenLayer
  module GraphqlCache
    class ProxyController < FrozenLayer::BaseController
      {% for method in ["get", "post", "put", "delete", "patch", "options"] %}
        def {{method.id}}(ctx : Context)
          proxy_url = FrozenLayer.config.proxy_url

          if proxy_url.nil?
            return  ctx.exec do
              put_status(404)
              send_resp("Proxy URL is not set")
            end
          end

          url, headers, body = params(ctx, proxy_url)
          respond ctx, HTTP::Client.{{method.id}}(url, headers, body: body)
        end
      {% end %}

      private def params(ctx : Context, proxy_url : String) : {URI, HTTP::Headers, IO?}
        request = ctx.request
        target_url = proxy_url + request.path
        headers = request.headers
        url = URI.parse(target_url)
        url.query_params = request.query_params

        {url, headers, request.body}
      end

      private def respond(ctx : Context, response : HTTP::Client::Response) : Context
        ctx.exec do
          response.headers.each do |key, value|
            put_resp_header(key, value)
          end

          put_status(response.status_code)
          send_resp(response.body)
        end
      end
    end
  end
end
