require 'rspec'

require_relative '../lib/d2p1'

RSpec.describe Submarine do
  before(:each) do
    @sub = Submarine.new
  end

  context 'when passed forwards' do
    it 'has the correct position out of the total' do
      @sub.forward 42
      @sub.forward 24
      expect(@sub.position).to eq 66
    end
  end

  context 'when passed downs' do
    it 'has the correct depth out of the total' do
      @sub.down 25
      @sub.down 75
      expect(@sub.depth).to eq 100
    end
  end

  context 'when passed downs and ups' do
    it 'has the correct depth of the sum of downs minus the sum of ups' do
      @sub.down 3
      @sub.up 1
      @sub.down 100
      expect(@sub.depth).to eq 102
    end
  end
end
