module FrozenLayer
  class BaseApplication < Grip::Application
    getter host : String = ENV["HOST"]? || DEFAULT_HOST
    getter port : Int32 = ENV["PORT"]?.try(&.to_i) || DEFAULT_PORT
    getter reuse_port : Bool = true # ameba:disable Naming/QueryBoolMethods

    def initialize
      super(environment: FrozenLayer.config.environment)

      if FrozenLayer.config.cors_regex || FrozenLayer.config.cors_domain
        router.insert(1, CorsMiddleware.new(
          cors_domain: FrozenLayer.config.cors_domain,
          cors_regex: FrozenLayer.config.cors_regex
        ))
      end

      draw_routes(FrozenLayer.config.graphql_path)
    end

    def draw_routes
      raise NotImplementedError.new("You must implement draw_routes method")
    end
  end
end
