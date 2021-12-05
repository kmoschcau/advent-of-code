# frozen_string_literal: true

require 'rspec'

require_relative '../lib/d3p1'

RSpec.describe '#d3p1' do
  context 'when running the example' do
    it 'returns the correct number' do
      result = d3p1(%w[
                      00100
                      11110
                      10110
                      10111
                      10101
                      01111
                      00111
                      11100
                      10000
                      11001
                      00010
                      01010
                    ])
      expect(result).to eq 198
    end
  end
end
