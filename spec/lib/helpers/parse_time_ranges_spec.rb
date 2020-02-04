require 'helpers/parse_time_ranges'

RSpec.describe Helpers::ParseTimeRanges do
  context 'with one range' do
    let(:input_string) { '(11:00-12:00) - (11:00-11:30)' }
    let(:first_ranges) { [[11 * 60, 12 * 60]] }
    let(:second_ranges) { [[11 * 60, 11 * 60 + 30]] }

    it 'returns parsed values' do
      expect(call).to eq([first_ranges, second_ranges])
    end
  end

  context 'with two ranges' do
    let(:input_string) { '(9:00-9:30, 10:00-10:30) - (9:15-10:15)' }
    let(:first_ranges) { [[9 * 60, 9 * 60 + 30], [10 * 60, 10 * 60 + 30]] }
    let(:second_ranges) { [[9 * 60 + 15, 10 * 60 + 15]] }

    it 'returns parsed values' do
      expect(call).to eq([first_ranges, second_ranges])
    end
  end

  def call
    subject.call(input_string)
  end
end
