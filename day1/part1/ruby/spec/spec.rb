# frozen_string_literal: true

require 'rspec'

require_relative '../lib/d1p1'

RSpec.describe '#count_increases' do
  context 'when running the example' do
    it 'returns the corrent number' do
      result = count_increases([
                                 199,
                                 200,
                                 208,
                                 210,
                                 200,
                                 207,
                                 240,
                                 269,
                                 260,
                                 263
                               ])
      expect(result).to eq 7
    end
  end
end
