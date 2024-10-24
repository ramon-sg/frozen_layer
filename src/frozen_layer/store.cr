require "redis"

module FrozenLayer
  module Store
    def self.logger
      @@logger ||= Log.for("Store")
    end

    def self.init
      logger.info { "Connecting to #{FrozenLayer.config.store_url}" }
      # # @@store ||= Redis.new(url: FrozenLayer.config.store_url)

      # @@store ||= ConnectionPool(Redis).new(
      #   capacity: FrozenLayer.config.store_connection_pool_size,
      #   timeout: FrozenLayer.config.store_connection_timeout
      # ) do
      #   Redis.new(url: FrozenLayer.config.store_url)
      # end

      @@store ||= Redis::PooledClient.new(
        url: FrozenLayer.config.store_url,
        pool_size: FrozenLayer.config.store_connection_pool_size,
        pool_timeout: FrozenLayer.config.store_connection_timeout
      )
      # pool_params = "?initial_pool_size=1&max_pool_size=10&checkout_timeout=#{FrozenLayer.config.store_connection_timeout}&retry_attempts=2&retry_delay=0.5&max_idle_pool_size=#{FrozenLayer.config.store_connection_pool_size}&keepalive=true&keepalive_count=5&keepalive_idle=10&keepalive_interval=15"
      # @@store = Redis::Client.new(
      #   URI.parse "#{FrozenLayer.config.store_url}#{pool_params}"
      # )
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

      # instance.connection do |conn|
      #   conn.set(key, value, ex: ex.try(&.to_i))
      # end
    end
  end
end
