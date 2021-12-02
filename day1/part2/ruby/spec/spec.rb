require 'rspec'

require_relative '../lib/d1p2'

RSpec.describe '#count_increases_windowed' do
  context 'when running the example' do
    it 'returns the corrent number' do
      result = count_increases_windowed([
                                          607,
                                          618,
                                          618,
                                          617,
                                          647,
                                          716,
                                          769,
                                          792
                                        ])
      expect(result).to eq 5
    end
  end
end
