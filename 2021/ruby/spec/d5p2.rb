# frozen_string_literal: true

require 'rspec'

require_relative '../lib/d5p2'

RSpec.describe '#d5p2' do
  context 'when running the example' do
    it 'returns the correct number' do
      lines = [
        '0,9 -> 5,9',
        '8,0 -> 0,8',
        '9,4 -> 3,4',
        '2,2 -> 2,1',
        '7,0 -> 7,4',
        '6,4 -> 2,0',
        '0,9 -> 2,9',
        '3,4 -> 1,4',
        '0,0 -> 8,8',
        '5,5 -> 8,2'
      ]
      expect(d5p2(lines)).to eq 12
    end
  end
end
