# frozen_string_literal: true

require 'rspec'

require_relative '../lib/d1p2'

RSpec.describe '#d1p2' do
  context 'when running the example' do
    it 'returns the corrent number' do
      result = d1p2(%w[
                      607
                      618
                      618
                      617
                      647
                      716
                      769
                      792
                    ])
      expect(result).to eq 5
    end
  end
end
