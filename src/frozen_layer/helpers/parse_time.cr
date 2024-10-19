# Converts a string in the format "1d", "1h", "30m", "45s" into a time span.
# Supported suffixes are:
#  - "s" for seconds
#  - "m" for minutes
#  - "h" for hours
#  - "d" for days
#
# Example:
#
# ```
# span = parse_time("1d") # Returns a Time::Span equivalent to 1 day
# ```
#
def parse_time(input : String) : Time::Span
  match = /(\d+)([smhd])/i.match(input)

  if match
    value = match[1].to_i
    unit = match[2].downcase

    case unit
    when "s"
      Time::Span.new(seconds: value)
    when "m"
      Time::Span.new(minutes: value)
    when "h"
      Time::Span.new(hours: value)
    when "d"
      Time::Span.new(days: value)
    else
      raise "Unsupported time unit: #{unit}"
    end
  else
    raise "Invalid input format #{input}"
  end
end
