require_relative 'card'


class Deck

  attr_accessor :deck
  
  def initialize()
    @deck = Deck.build_deck()
  end

  def self.build_deck()
    deck = []

    Card.ranks.each do |rank|
      Card.suits.each do |suit|
        deck << Card.new(rank, suit)
      end
    end

    deck.shuffle!
    #p deck
    return deck
  end
end

#deck = Deck.new()