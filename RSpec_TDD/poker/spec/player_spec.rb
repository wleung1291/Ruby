require 'rspec'
require 'player'

describe Player do
  subject(:p1) {Player.new()}

  describe "#discard_cards" do 
    it "Discard the card at index 0" do
      p1.discard_cards()
      expect(p1.hand.hand.length).to eq(4)
    end
  end

end