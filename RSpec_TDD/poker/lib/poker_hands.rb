
module Poker_Hands

  #HANDS = [:high_card, :one_pair, :two_pair, :three_kind, :straight, :flush,
  #  :full_house, :four_kind, :straight_flush, :royal_flush]

  HANDS = [:royal_flush, :straight_flush, :four_kind, :full_house, :flush,
    :straight, :three_kind, :two_pair, :one_pair, :high_card]

  def high_card()
    cards = self.hand.sort_by! { |card| card.rank[0] }.reverse!
    high = cards.first

    return true
  end

  def one_pair()
    ranks = []
    self.hand.each {|card|  ranks << card.rank[0] }

    ranks.any? { |ele| ranks.count(ele) == 2}
  end

  def two_pair()
    num_pairs = 0
    ranks = []
    self.hand.each {|card|  ranks << card.rank[0] }

    ranks.each do |ele| 
      if ranks.count(ele) == 2 
        num_pairs += 1
      end      
    end

    return true if num_pairs == 4
    return false
  end

  def three_kind()
    ranks = []
    self.hand.each {|card|  ranks << card.rank[0] }

    ranks.any? { |ele| ranks.count(ele) == 3}
  end

  # Five cards in a sequence, but not of the same suit. 
  def straight()
    ranks = []
    self.hand.each {|card|  ranks << card.rank[0] }

    # case if the straight is A5432
    if ranks[0] == 14
      if ranks[0] - ranks[1] == 9
        (1..3).each do |i|
          return false if ranks[i] - ranks[i + 1] != 1
        end
        return true
      end
    end

    (0..3).each do |i|
      return false if ranks[i] - ranks[i + 1] != 1
    end
    return true
  end

  # Any five cards of the same suit, but not in a sequence. 
  def flush()
    suits = []
    self.hand.each {|card| suits << card.suit }
  
    return suits.any? { |ele| suits.count(ele) == 5}
  end

  # Three of a kind with a pair. 
  def full_house()
    return three_kind() && one_pair()
  end

  # All four cards of the same rank. 
  def four_kind()
    ranks = []
    self.hand.each {|card| ranks << card.rank[0] }

    return ranks.any? { |ele| ranks.count(ele) == 4}
  end

  # Five cards in a sequence, all in the same suit. 
  def straight_flush
    return straight() && flush()
  end

  # A, K, Q, J, 10, all the same suit. 
  def royal_flush()
    ranks = []
    self.hand.each {|card|  ranks << card.rank[0] }
    suits = []
    self.hand.each {|card| suits << card.suit }
    
    if ranks[0] == 14
      (0..3).each do |i|
        return false if ranks[i] - ranks[i + 1] != 1
      end
      return true if suits.any? { |ele| suits.count(ele) == 5}
    end

    return false
  end

  def beat
    
  end
end