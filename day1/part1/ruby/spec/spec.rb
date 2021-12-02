require 'rspec'

require_relative '../lib/d1p1'

RSpec.describe '#count_increases' do
  context 'when passed decreasing numbers' do
    it 'returns 0' do
      expect(count_increases([4, 3, 2, 1])).to eq 0
    end
  end

  context 'when passed increasing numbers' do
    it 'returns length minus one' do
      expect(count_increases([1, 2, 3, 4])).to eq 3
    end
  end

  context 'when passed alternating numbers' do
    it 'returns the number of increases' do
      expect(count_increases([0, 2, 1, 4])).to eq 2
    end
  end
end
