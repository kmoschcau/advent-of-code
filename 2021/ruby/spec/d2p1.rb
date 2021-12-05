# frozen_string_literal: true

require 'rspec'

require_relative '../lib/d2p1'

RSpec.describe '#d2p1' do
  context 'when running the example' do
    it 'returns the correct number' do
      result = d2p1([
                      'forward 5',
                      'down 5',
                      'forward 8',
                      'up 3',
                      'down 8',
                      'forward 2'
                    ])
      expect(result).to eq 150
    end
  end
end

RSpec.describe SubmarineD2P1 do
  before(:each) do
    @sub = SubmarineD2P1.new
  end

  context 'when running the example' do
    before(:each) do
      @sub.forward 5
      @sub.down 5
      @sub.forward 8
      @sub.up 3
      @sub.down 8
      @sub.forward 2
    end

    it 'has the correct depth' do
      expect(@sub.depth).to eq 10
    end

    it 'has the correct position' do
      expect(@sub.position).to eq 15
    end
  end
end
