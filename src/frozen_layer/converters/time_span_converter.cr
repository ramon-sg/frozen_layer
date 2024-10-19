module FrozenLayer
  module TimeSpanConverter
    def self.from_json(value : JSON::PullParser) : Time::Span
      raw = value.read_string
      parse_time(raw)
    end
  end
end
