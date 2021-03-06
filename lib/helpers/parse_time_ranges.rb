# frozen_string_literal: true

module Helpers
  class ParseTimeRanges
    PATTERN_REGEXP = /\((.*)\)\s*-\s*\((.*)\)/.freeze
    TIME_RANGES_SEPARATOR_REGEXP = /\s*,\s*/.freeze
    TIME_RANGE_SEPARATOR_REGEXP = /\s*-\s*/.freeze
    TIME_SEPARATOR_REGEXP = /\s*:\s*/.freeze

    # example: "(9:00-11:00, 13:00-15:00) - (9:00-9:15, 10:00-10:15)"
    # output: "[[[540, 660], [780, 900]], [[540, 555], [600, 615]]]"
    def call(input_string)
      match_data = input_string.match(PATTERN_REGEXP)
      first_part = match_data[1]
      second_part = match_data[2]
      [parse_time_ranges(first_part), parse_time_ranges(second_part)]
    end

    private

    # example: "(9:00-11:00, 13:00-15:00)"
    def parse_time_ranges(ranges_string)
      ranges_string.split(TIME_RANGES_SEPARATOR_REGEXP).map do |range_string|
        parse_time_range(range_string)
      end
    end

    # example: "9:00-11:00"
    def parse_time_range(range_string)
      start_time, end_time = range_string.split(TIME_RANGE_SEPARATOR_REGEXP)
      [parse_time(start_time), parse_time(end_time)]
    end

    # example: "9:00"
    def parse_time(time_string)
      hours, minutes = time_string.split(TIME_SEPARATOR_REGEXP)
      hours.to_i * 60 + minutes.to_i
    end
  end
end
