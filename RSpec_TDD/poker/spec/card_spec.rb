require 'rspec'
require 'card'

describe Card do
  subject(:card) {Card.new(4, "♤")}

  describe "#initialize" do
    it "Create a '4♤' card" do
      expect(card.rank).to eq(4)
      expect(card.suit).to eq("♤")
    end
  end

end