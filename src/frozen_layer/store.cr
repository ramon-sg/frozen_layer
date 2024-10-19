require "redis"

module FrozenLayer
  module Store
    def self.instance
      Log.for("store").info { "Connecting to #{FrozenLayer.config.store_url}" }

      @@store ||= Redis.new(url: FrozenLayer.config.store_url)
    end

    def self.get(key)
      instance.get(key)
    end

    # ex -- Set the specified expire time
    def self.set(key, value, ex : Time::Span? = nil)
      instance.set(key, value, ex: ex.try(&.to_i))
    end
  end
end
