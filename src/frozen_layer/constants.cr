module FrozenLayer
  module Environment
    DEVELOPMENT = "development"
    TEST        = "test"
    PRODUCTION  = "production"
  end

  DEFAULT_HOST = "localhost"
  DEFAULT_PORT = 3000

  VERSION = {{ `shards version #{__DIR__}`.chomp.stringify }}
end
