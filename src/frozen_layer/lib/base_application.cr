module FrozenLayer
  class BaseApplication < Grip::Application
    def initialize
      super(environment: FrozenLayer.config.environment)
      draw_routes
    end

    def host : String
      ENV["HOST"]? || DEFAULT_HOST
    end

    def port : Int32
      ENV["PORT"]?.try(&.to_i) || DEFAULT_PORT
    end

    def draw_routes
      raise NotImplementedError.new("You must implement draw_routes method")
    end
  end
end
