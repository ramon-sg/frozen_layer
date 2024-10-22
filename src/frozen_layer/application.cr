module FrozenLayer
  class Application < BaseApplication
    def draw_routes
      # GRAPHQL CACHE
      post "/", GraphqlCache::EndpointController, as: :index

      get "/version", GraphqlCache::VersionController, as: :index
    end
  end
end
