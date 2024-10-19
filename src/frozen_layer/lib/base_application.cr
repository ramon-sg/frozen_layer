module FrozenLayer
  class BaseApplication < Grip::Application
    def initialize
      super(environment: FrozenLayer.config.environment)
      draw_routes
    end

    def host : String
      ENV["HOST"]? || "localhost"
    end

    def port : Int32
      ENV["PORT"]?.try(&.to_i) || 3000
    end

    def draw_routes
      raise NotImplementedError.new("You must implement draw_routes method")
    end
  end
end
