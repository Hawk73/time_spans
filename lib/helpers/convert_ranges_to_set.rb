# frozen_string_literal: true

module Helpers
  class ConvertRangesToSet
    # example: "[[540, 660], [780, 900]]"
    # output: "[540,541..659,660,780,781..899,900]"
    def call(ranges)
      ranges.flat_map do |range|
        (range.first..range.last).to_a
      end
    end
  end
end
