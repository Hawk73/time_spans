# frozen_string_literal: true

module Helpers
  class HumanizeSet
    # example: "[540,541..559,660,780,781..899,900]"
    # output: "(9:00-11:00, 13:00-15:00)"
    def call(set)
      times = convert_set_to_ranges(set).map do |range|
        convert_range_to_time(range)
      end
      "(#{times.join(', ')})"
    end

    private

    # example: [540,541..559,660,780,781..899,900]
    # output: [540, 660], [780, 900]
    def convert_set_to_ranges(set)
      ranges = set.chunk_while { |a, b| a.succ == b }.map(&:minmax)
      filter_empty_ranges(ranges)
    end

    def filter_empty_ranges(ranges)
      ranges.reject do |range|
        range.first == range.last
      end
    end

    # example: [540, 660]
    # output: "9:00-11:00"
    def convert_range_to_time(range)
      "#{convert_minutes_to_time(range.first)}-#{convert_minutes_to_time(range.last)}"
    end

    # example: 540
    # output: "9:00"
    def convert_minutes_to_time(minutes)
      hours_string = (minutes / 60).to_s
      minutes_string = (minutes % 60).to_s.rjust(2, '0')
      "#{hours_string}:#{minutes_string}"
    end
  end
end
