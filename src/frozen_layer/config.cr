module FrozenLayer
  class Configuration
    include JSON::Serializable

    property environment : String = Environment::DEVELOPMENT

    @[JSON::Field(key: "storeUrl")]
    property store_url : String | Nil

    @[JSON::Field(key: "graphqlUrl")]
    property graphql_url : String = "/graphql"

    @[JSON::Field(key: "operationsMap")]
    property operations_map : OperationsMap | Nil

    @[JSON::Field(key: "storeConnectionPoolSize")]
    property store_connection_pool_size : Int32 = 5

    @[JSON::Field(key: "storeConnectionTimeout")]
    property store_connection_timeout : Float64 = 0.01

    def dev?
      environment == Environment::DEVELOPMENT
    end

    def test?
      environment == Environment::TEST
    end

    def prod?
      environment == Environment::PRODUCTION
    end
  end

  def self.load_config(file_path : String)
    json = File.read(file_path)

    @@config = Configuration.from_json(json)
  end

  def self.load_config?(file_path : String | Nil)
    load_config(file_path) if file_path && File.exists?(file_path)
  end

  def self.config
    @@config ||= Configuration.from_json(%({}))
  end

  def self.configure(&)
    yield config
  end
end
