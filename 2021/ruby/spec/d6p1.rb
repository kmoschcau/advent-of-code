# frozen_string_literal: true

require 'rspec'

require_relative '../lib/d6p1'

RSpec.describe '#d6p1' do
  context 'when running the example' do
    it 'returns the correct number' do
      lines = ['3,4,3,1,2']
      expect(d6p1(lines)).to eq 5934
    end
  end
end
