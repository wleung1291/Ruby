class Board
  attr_accessor :cups, :name1, :name2 
  
  def initialize(name1, name2)
  #   @name1 = name1
  #   @name2 = name2
  #   @cups = Array.new(14){Array.new}
# 
  #   place_stones()
  end

  # helper method to #initialize every non-store cup with four stones each
  def place_stones
    cups.each_with_index do |cup, i|
      4.times { cup << :stone } if i != 6 && i != 13
    end
  end

  def valid_move?(start_pos) 
    raise "Invalid starting cup" if start_pos < 0 || start_pos > 12  
    raise "Starting cup is empty" if cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
  #  stones = cups[start_pos].length
  #  cups[start_pos] = []
  #  cup = start_pos
#
  #  until stones == 0
  #    cup += 1
  #    cup = 0 if cup > 13
  #    if cup == 6
  #      if current_player_name == @name1 # place into player1's stpre
  #        @cups[6] << :stone
  #        stones -= 1
  #      end
  #    elsif cup == 13
  #      if current_player_name == @name2 # place into player2's store
  #        @cups[13] << :stone 
  #        stones -= 1
  #      end
  #    else
  #      @cups[cup] << :stone
  #      stones -= 1
  #    end
  #  end
#
  #  render
  #  next_turn(cup)
  end

  # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif cups[ending_cup_idx].count == 1
      :switch
    else
      # continue with an unempty cup
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return cups[0..5].all? { |cup| cup.empty?} || cups[7..12].all? { |cup| cup.empty?} 
  end

  def winner
    if cups[6].length == cups[13].length
      :draw
    elsif cups[6].length > cups[13].length
      return name1
    else
      return name2
    end
  end
  
end

#board = Board.new("p1", "p2")
#p board.cups