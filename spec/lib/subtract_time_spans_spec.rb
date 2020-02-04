require 'subtract_time_spans'

RSpec.describe SubtractTimeSpans do
  it 'returns true' do
    expect(subject.call).to be_truthy
  end
end
