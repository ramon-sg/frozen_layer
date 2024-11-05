require "http/client"

module FrozenLayer
  class Application < BaseApplication
    def draw_routes
      get "/version", GraphqlCache::VersionController, as: :index
      post "/", GraphqlCache::EndpointController, as: :index

      # Proxy Controller
      {% for method in ["get", "put", "delete", "patch", "options"] %}
        {{method.id}} "*", GraphqlCache::ProxyController
      {% end %}
    end
  end
end
