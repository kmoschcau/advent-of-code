# frozen_string_literal: true

require 'rspec'

require_relative '../lib/d6p2'

RSpec.describe '#d6p2' do
  context 'when running the example' do
    it 'returns the correct number' do
      lines = ['3,4,3,1,2']
      expect(d6p2(lines)).to eq 26_984_457_539
    end
  end
end
