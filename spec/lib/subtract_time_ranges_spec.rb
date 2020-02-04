require 'subtract_time_ranges'

RSpec.describe SubtractTimeRanges do
  it 'returns true' do
    expect(subject.call).to be_truthy
  end
end
