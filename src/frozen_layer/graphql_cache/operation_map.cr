struct OperationMapItem
  include JSON::Serializable

  @[JSON::Field(converter: FrozenLayer::TimeSpanConverter)]
  property expiration : Time::Span

  @[JSON::Field(key: "enabled")]
  property? enabled : Bool = true
end

alias OperationsMap = Hash(String, OperationMapItem)
