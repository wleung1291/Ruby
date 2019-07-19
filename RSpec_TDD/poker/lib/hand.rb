require_relative 'poker_hands'
require_relative 'deck'

class Hand
  include Poker_Hands
  attr_accessor :hand
  DECKS = Deck.new()
  
  def initialize(hand = nil)
    @hand = hand || deal_five()
    #@hand = deal_five()

  end

  # returns an array of 5 cards in reverse order by rank i.e., 11 8 4 3 2
  def deal_five()
    cards = DECKS.deck.shift(5)
    cards.sort_by! { |card| card.rank[0] }.reverse!

    return cards
  end

  # evaluate hand for poker hand rankings 
  def eval_hand
    HANDS.each do |rank|
      p rank
      return rank if self.send("#{rank}")
    end
  end

  def beat
    
  end

end

#hand1 = Hand.new()
##hand2 = Hand.new()
#
#p hand1.hand
#p hand1.eval_hand
#p hand2.hand