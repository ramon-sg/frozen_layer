require "../spec_helper"
require "../../src/frozen_layer/helpers/extract_operation_name"

describe "extract_operation_name" do
  it "extracts the name from a query operation" do
    query_string = %(
      query GetUser {
        user(id: "123") {
          name
        }
      }
    )

    operation_name = extract_operation_name(query_string)
    operation_name.should eq "GetUser"
  end

  it "extracts the name from a mutation operation" do
    query_string = %(
      mutation CreateUser {
        createUser(name: "John") {
          id
        }
      }
    )
    operation_name = extract_operation_name(query_string)
    operation_name.should eq "CreateUser"
  end

  it "extracts the name from a subscription operation" do
    query_string = %(
      subscription OnUserAdded {
        userAdded {
          id
          name
        }
      }
    )
    operation_name = extract_operation_name(query_string)
    operation_name.should eq "OnUserAdded"
  end

  it "returns nil if no operation name is found" do
    query_string = %(
      {
        user(id: "123") {
          name
        }
      }
    )
    operation_name = extract_operation_name(query_string)
    operation_name.should be_nil
  end

  it "returns nil if the operation is malformed" do
    query_string = "query { user(id: \"123\") { name } }"
    operation_name = extract_operation_name(query_string)
    operation_name.should be_nil
  end
end
