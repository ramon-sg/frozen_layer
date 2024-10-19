# Function to extract the operation name from a GraphQL query string.
# It searches for `query`, `mutation`, or `subscription` followed by the operation name
# and returns the name if found. Returns `nil` if no operation name is detected.
# Example:
#   Input: 'query GetUser { ... }'
#   Output: 'GetUser'
def extract_operation_name(query_string : String?) : String?
  return nil if query_string.nil?

  regex = /(?:query|mutation|subscription)\s+(\w+)/

  if match = regex.match(query_string)
    match[1]
  else
    nil
  end
end
