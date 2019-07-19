class Card 
  SUITS = ["♤", "♧", "♥", "♦︎"]
  # ♤ ♧ ♥ ♦︎
  #RANKS = %w[2 3 4 5 6 7 8 9 10 J Q K A]
  RANKS = {
   2 => "2",
   3 => "3",
   4 => "4",
   5 => "5",
   6 => "6",
   7 => "7",
   8 => "8",
   9 => "9",
   10 => "10",
   11 => "J",
   12 => "Q",
   13 => "K",
   14 => "A"
  }
  attr_reader :suit, :rank

  def self.suits
    return SUITS
  end

  def self.ranks
    return RANKS
  end

  def initialize(suit, rank)
    @rank = rank
    @suit = suit
  end

end