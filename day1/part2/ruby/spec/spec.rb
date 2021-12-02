require 'rspec'

require_relative '../lib/d1p2'

RSpec.describe '#count_increases_windowed' do
  context 'when passed decreasing windows' do
    it 'returns 0' do
      expect(count_increases_windowed([2, 2, 1, 1])).to eq 0
    end
  end

  context 'when passed increasing windows' do
    it 'returns 1' do
      expect(count_increases_windowed([1, 1, 2, 2])).to eq 1
    end
  end

  context 'when passed equal windows' do
    it 'returns 0' do
      expect(count_increases_windowed([1, 1, 1, 1])).to eq 0
    end
  end
end
