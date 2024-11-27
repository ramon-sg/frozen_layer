require "redis"

module FrozenLayer
  module Store
    def self.logger
      @@logger ||= Log.for("Store")
    end

    def self.init
      logger.info { "Connecting to #{FrozenLayer.config.store_url}" }

      @@store ||= begin
        create_store
      rescue ex : Redis::Error
        logger.error { "Redis connection failed: #{ex.message}" }
        sleep 1
        create_store
      end.as(Redis::PooledClient)
    end

    def self.create_store : Redis::PooledClient
      Redis::PooledClient.new(
        url: FrozenLayer.config.store_url,
        pool_size: FrozenLayer.config.store_connection_pool_size,
        pool_timeout: FrozenLayer.config.store_connection_timeout
      )
    end

    def self.instance
      @@store || init
    end

    def self.get(key)
      logger.debug { "Getting #{key}" }

      start_time = Time.monotonic

      instance.get(key).tap do |value|
        end_time = Time.monotonic
        duration = (end_time - start_time).total_milliseconds

        logger.debug { "Got #{truncate_string(value)} in #{duration}ms" }
      end
    end

    # ex -- Set the specified expire time
    def self.set(key, value, ex : Time::Span? = nil)
      logger.debug { "Set #{key} to #{truncate_string(value)}" }
      instance.set(key, value || "", ex: ex.try(&.to_i))
    end
  end
end
