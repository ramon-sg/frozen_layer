module FrozenLayer
  class Application < BaseApplication
    def draw_routes
      # GRAPHQL CACHE
      scope "/cache" do
        post "/graphql", GraphqlCache::EndpointController, as: :index
      end

      get "/version", GraphqlCache::VersionController, as: :index
    end
  end
end
