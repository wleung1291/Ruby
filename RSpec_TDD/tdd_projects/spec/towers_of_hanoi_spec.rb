require 'rspec'
require 'towers_of_hanoi'

describe Towers_Of_Hanoi do
  let(:stack) { [[3, 2, 1], [], []] }
  subject(:game) { Towers_Of_Hanoi.new(stack) }

  describe "#initialize" do
    it "set the board" do
      expect(game.board).to eq( [[3, 2, 1], [], []] )
    end
  end

  describe "#move" do 
    it "a disk can be placed in an empty pile" do
      game.move(0, 1)
      expect(game.board).to eq([ [3, 2], [1], [] ])
    end

    it "a disk cannot be selected from an empty pile" do
      game.move(1, 2)
      expect(game.board).to eq([ [3, 2, 1], [], [] ])
    end

    it "No larger disk may be placed on top of a smaller disk" do
      game.move(0, 1)
      game.move(0, 1)
      expect(game.board).not_to eq([ [3], [1, 2], [] ])
    end
  end

  describe "#won?" do 
    it "is not won at the start or on the original pile" do
      expect(game.won?).to be(false)
    end 

    it "is won when all disks are in order in non-original pile" do
      game.instance_variable_set(:@board, [[], [3, 2, 1], []] )
      expect(game.won?).to be(true)
    end
  end


end