require_relative 'helpers/convert_ranges_to_set'
require_relative 'helpers/humanize_set'
require_relative 'helpers/parse_time_ranges'

class SubtractTimeRanges
  attr_accessor(
    :convert_ranges_to_set,
    :humanize_set,
    :parse_time_ranges
  )

  def initialize(
    convert_ranges_to_set: Helpers::ConvertRangesToSet.new,
    humanize_set: Helpers::HumanizeSet.new,
    parse_time_ranges: Helpers::ParseTimeRanges.new
  )
    @convert_ranges_to_set = convert_ranges_to_set
    @humanize_set = humanize_set
    @parse_time_ranges = parse_time_ranges
  end

  def call(input_string)
    first_ranges, second_ranges = parse_time_ranges.call(input_string)
    # TODO: validate ranges

    first_set = convert_ranges_to_set.call(first_ranges)
    second_set = convert_ranges_to_set.call(remove_bordering_values(second_ranges))

    result_set = first_set - second_set

    humanize_set.call(result_set)
  end

  private

  def remove_bordering_values(ranges)
    ranges.map do |range|
      [range.first + 1, range.last - 1]
    end
  end
end
