require "digest"

alias Type = Nil |
             Bool |
             Int32 |
             Int64 |
             Float64 |
             String |
             JSON::Any |
             Array(Type) |
             Hash(String, Type)

# This function takes any type of value (any value that can be converted to a string)
# as input and generates a unique SHA-256 hash value.
#
# *regardless of the order of the elements, it always returns the same value*
#
# ## Example:
# ```
# input_value1 = JSON.parse(%(
#   ["a", 2, 1]
# ))
#
# input_value2 = JSON.parse(%(
#   [1,2, "a"]
# ))
#
# hashed_value1 = generate_hash(input_value1)
# puts hashed_value1 # => "ddtt33"
#
# hashed_value2 = generate_hash(input_value2)
# puts hashed_value2 # => "ddtt33"
# ```
def generate_hash(value : Type | JSON::Any) : String
  Digest::SHA256.hexdigest(
    normalize_any(value)
  )
end

def normalize_any(value : Type | JSON::Any) : String
  if hash = as_hash(value)
    sorted_keys = hash.keys.sort!
    sorted_hash = Hash(String, String).new

    sorted_keys.each do |key|
      value = hash[key]
      sorted_hash[key] = normalize_any(value)
    end

    sorted_hash.to_json
  elsif array = as_array(value)
    parsed_array = array.map { |item| normalize_any(item) }
    sorted_pared_array = parsed_array.sort
    sorted_pared_array.to_json
  else
    value.to_json
  end
end

def as_hash(value)
  return value if value.is_a?(Hash)
  value.as_h? if value.is_a?(JSON::Any)
end

def as_array(value)
  return value if value.is_a?(Array)
  value.as_a? if value.is_a?(JSON::Any)
end
