require 'subtract_time_ranges'

RSpec.describe SubtractTimeRanges do
  input_strings_with_results =
    {
      # From task
      '(11:00-12:00) - (11:00-11:30)' => '(11:30-12:00)',
      '(10:00-11:00) - (10:00-11:00)' => '()',
      '(8:00-8:30) - (8:30-13:00)' => '(8:00-8:30)',
      '(9:00-9:30, 10:00-10:30) - (9:15-10:15)' => '(9:00-9:15, 10:15-10:30)',
      '(9:00-11:00, 13:00-15:00) - (9:00-9:15, 10:00-10:15, 12:30-16:00)' => '(9:15-10:00, 10:15-11:00)',
      # Additional
      '(11:00-12:00) - (11:15-11:30)' => '(11:00-11:15, 11:30-12:00)', # in the middle
      '(11:00-12:00) - (10:15-11:30)' => '(11:30-12:00)', # on the left
      '(11:00-12:00) - (12:15-12:30)' => '(11:00-12:00)', # no intersection
      '(11:00-11:01) - (11:01-11:02)' => '(11:00-11:01)'  # one minute
    }

  input_strings_with_results.each do |input_string, result|
    context "when input_string is #{input_string}" do
      it 'returns true' do
        expect(subject.call(input_string)).to eq(result)
      end
    end
  end
end
