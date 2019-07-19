require_relative 'hand'
require_relative 'deck'

class Player
  attr_accessor :hand

  def initialize(pot)
    @hand = Hand.new()
    @pot = pot
  end

  def decide()
    print "(c)all, (b)et, or (f)old? > "
    input = gets.chomp
    input = input.downcase

    case input
    when "c"
      return :call
    when "b"
      return :bet
    when "f"
      return :fold
    else
      decide()
    end
  end

  def discard_cards()
    discard_pile = []

    print "Discard 1, 2, or 3 cards? > "
    num_cards = gets.chomp.to_i
    
    num_cards.times do
      print "Select the card indice to discard, one at a time > "
      card_indice = gets.chomp.to_i
      discard_pile << self.hand.hand.delete_at(card_indice)
    end

    return discard_pile
  end 


end

#p1 = Player.new()
#p2 = Player.new()

#p p2
#p p1
#p1.discard_cards

# p p1.hand
#p1.hand.eval_hand
