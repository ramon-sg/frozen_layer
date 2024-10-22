module FrozenLayer
  class Application < BaseApplication
    def draw_routes
      # GRAPHQL CACHE
      post "/", GraphqlCache::EndpointController, as: :index

      get "/version", GraphqlCache::VersionController, as: :index

      get "/test/1", GraphqlCache::TestController, as: :test1

      get "/test/2", GraphqlCache::TestController, as: :test2
    end
  end
end
