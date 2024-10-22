# This function truncates a string to a specified maximum length.
# If the string exceeds the maximum length, it appends "..." to indicate truncation.
# Parameters:
# - text: The input string to be truncated.
# - max_length: The maximum length of the output string, including the "..." if truncated.
# - omission: The string to append to the truncated string. Default is "...".
# Returns:
# - A string that is either the original string (if it's shorter or equal to max_length)
#   or the truncated version with "..." appended.
def truncate_string(text : String?, max_length : Int32 = 50, omission : String = "...") : String?
  return text if text.nil? || text.size <= max_length

  truncated = text[0...(max_length - 3)]
  truncated + omission
end
