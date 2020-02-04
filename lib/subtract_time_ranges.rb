require 'helpers/parse_time_ranges'

class SubtractTimeRanges
  attr_accessor(:parse_time_ranges)

  def initialize(parse_time_ranges: Helpers::ParseTimeRanges.new)
    @parse_time_ranges = parse_time_ranges
  end

  def call(input_string)
    ranges = parse_time_ranges.call(input_string)
    true
  end
end
