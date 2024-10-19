require "json"
require "../spec_helper"
require "../../src/frozen_layer/helpers/generate_hash"

describe "generate_hash" do
  it "should return the same hash value for different order of elements" do
    input_value1 = JSON.parse(%({
      "id": 1,
      "aids": [1, 2, 3]
    }))

    input_value2 = {
      "aids" => [3, 1, 2],
      "id"   => 1,
    }

    hashed_value1 = generate_hash(input_value1)
    hashed_value2 = generate_hash(input_value2)

    hashed_value1.should eq hashed_value2
  end
end
