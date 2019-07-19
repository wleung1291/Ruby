require 'rspec'
require 'deck'

describe Deck do
  subject(:deck) {Deck.new()}

  describe "#initialize" do
    it "creates a 52 card deck" do
      expect(deck.deck.length).to eq(52)
    end
  end
  
end