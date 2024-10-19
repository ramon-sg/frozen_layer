require "http/client"
require "dotenv"
require "log"
require "grip"

require "./frozen_layer/lib/*"
require "./frozen_layer/helpers/*"
require "./frozen_layer/converters/*"
require "./frozen_layer/*"

Dotenv.load? ".env.#{FrozenLayer.config.environment}"
FrozenLayer.load_config?(ENV["CONFIG_PATH"]?)

FrozenLayer.configure do |config|
  config.environment = ENV["CRYSTAL_ENV"] if ENV["CRYSTAL_ENV"]?
  config.store_url = ENV["STORE_URL"] if ENV["STORE_URL"]?
  config.graphql_url = ENV["GRAPHQL_URL"] if ENV["GRAPHQL_URL"]?
end

FrozenLayer::Application.new.run
