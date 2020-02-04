require 'helpers/humanize_set'

RSpec.describe Helpers::HumanizeSet do
  let(:set) { (540..660).to_a + (780..900).to_a }

  it 'returns humanized value' do
    expect(subject.call(set)).to eq('(9:00-11:00, 13:00-15:00)')
  end
end
