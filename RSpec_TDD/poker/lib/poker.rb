require_relative 'deck'
require_relative 'player'

class Poker
  attr_accessor :players

  def initialize 
    @players = []

  end

  def player
    print "How many players? > "
    input = gets.chomp.to_i

    input.times {
      players << Player.new(100)
    }
    
  end

  def print_cards()
    players.each do |player|
      puts player
      player.hand.hand.each do |cards|
        puts "#{cards.rank[1]}#{cards.suit}"
      end
    end
  end


  if __FILE__ == $PROGRAM_NAME
    poker = Poker.new()
    poker.player
    poker.print_cards()
  end

end