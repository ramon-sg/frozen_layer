require "http/client"

module FrozenLayer
  class Application < BaseApplication
    def draw_routes(graphql_path : String)
      get "/version", GraphqlCache::VersionController, as: :index
      post graphql_path, GraphqlCache::EndpointController, as: :index

      # Proxy Controller
      {% for method in ["get", "put", "delete", "patch", "options"] %}
        {{method.id}} "*", GraphqlCache::ProxyController
      {% end %}
    end
  end
end
