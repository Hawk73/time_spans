# frozen_string_literal: true

require 'helpers/convert_ranges_to_set'

RSpec.describe Helpers::ConvertRangesToSet do
  let(:ranges) { [[1, 4], [6, 9]] }
  let(:values) { [1, 2, 3, 4, 6, 7, 8, 9] }

  it 'returns array with values' do
    expect(subject.call(ranges)).to eq(values)
  end
end
