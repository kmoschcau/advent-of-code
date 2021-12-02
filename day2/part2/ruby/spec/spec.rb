require 'rspec'

require_relative '../lib/d2p2'

RSpec.describe Submarine do
  before(:each) do
    @sub = Submarine.new
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
      expect(@sub.depth).to eq 60
    end

    it 'has the correct position' do
      expect(@sub.position).to eq 15
    end
  end
end
