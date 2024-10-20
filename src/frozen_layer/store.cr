require "redis"
require "pool/connection"

module FrozenLayer
  module Store
    def self.logger
      @@logger ||= Log.for("Store")
    end

    def self.init
      logger.info { "Connecting to #{FrozenLayer.config.store_url}" }
      # @@store ||= Redis.new(url: FrozenLayer.config.store_url)

      @@store ||= ConnectionPool(Redis).new(
        capacity: FrozenLayer.config.store_connection_pool_size,
        timeout: FrozenLayer.config.store_connection_timeout
      ) do
        Redis.new(url: FrozenLayer.config.store_url)
      end
    end

    def self.instance
      @@store || init
    end

    def self.get(key)
      logger.debug { "Getting #{key}" }

      # instance.get(key).tap do |value|
      #   logger.debug { "Got #{value}" }
      # end
      instance.connection do |conn|
        conn.get(key).tap do |value|
          logger.debug { "Got #{value}" }
        end
      end
    end

    # ex -- Set the specified expire time
    def self.set(key, value, ex : Time::Span? = nil)
      logger.debug { "Set #{key} to #{value}" }
      # instance.set(key, value, ex: ex.try(&.to_i))

      instance.connection do |conn|
        conn.set(key, value, ex: ex.try(&.to_i))
      end
    end
  end
end
