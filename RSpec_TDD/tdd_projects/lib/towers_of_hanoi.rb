# The puzzle starts with the disks in a neat stack in ascending order of size on 
# one rod, the smallest at the top, thus making a conical shape.#

# The objective of the puzzle is to move the entire stack to another rod, 
# obeying the following simple rules:
#   1. Only one disk can be moved at a time.
#   2. Each move consists of taking the upper disk from one of the stacks and 
#     placing it on top of another stack or on an empty rod.
#   3. No larger disk may be placed on top of a smaller disk.
# With 3 disks, the puzzle can be solved in 7 moves. The minimal number of moves 
# required to solve a Tower of Hanoi puzzle is 2n − 1, where n = number of disks.

class OutOfBounds < StandardError
  def bounds
    puts "Input is out of bounds"
  end
end

class Towers_Of_Hanoi

  attr_reader :board, :original

  def initialize(stack)
    @board = stack
    @original = stack.map { |pile| pile.dup }
    @disks = stack[0].length
  end

  def move(selected_pile, put_pile)
    disk = board[selected_pile].last
    
    # if the selected pile is not empty
    if !board[selected_pile].empty?
      # if the put pile is empty or the disk is smaller than the top disk
      if board[put_pile].empty? || board[put_pile].last > disk
        board[put_pile] << board[selected_pile].pop
      elsif board[put_pile].last < disk
        puts "Cannot move larger disk on top of smaller disk!"
      end
    else
      puts "Cannot select from an empty pile!"
    end
  end

  def won?
    # checks if all but one pile is empty
    if board.one? { |pile| !pile.empty? }
      # returns the non-empty pile(2d-array)
      pile = board.select { |pile| !pile.empty? }
      # checks if the board is not the same as the original
      if original != board
        return true if pile[0] == pile[0].sort.reverse
      end
    end

    return false
  end
    
  def render
    duplicate = @board.map { |pile| pile.dup }

    duplicate.each do |pile|
      @disks.times do |i|
        if !pile[i].is_a?(Integer)
          pile[i] = " "
        end
      end
    end

    row = @disks.dup
    @disks.times do
      puts "#{duplicate[0][row-1]}|#{duplicate[1][row-1]}|#{duplicate[2][row-1]}" 
      row -= 1
    end
    puts "- - -"
    puts "0 1 2" 
  end
  
  def game_over
    puts
    render()
    puts "You Win!"
  end

  def play()
    until won?
      begin
        puts
        render()
        puts
        print "Select the pile to remove from (0, 1, or 2): "
        select_pile = gets.chomp.to_i
        print "Select the pile to insert (0, 1, or 2): "
        put_pile = gets.chomp.to_i
        if !select_pile.between?(0,2) || !put_pile.between?(0, 2)
          raise OutOfBounds
        end 
      rescue OutOfBounds => e 
        puts e.bounds
        retry
      end
        
      move(select_pile, put_pile)
    end
    
    game_over()
  end

end


if $PROGRAM_NAME == __FILE__
  game = Towers_Of_Hanoi.new([ [4, 3, 2, 1], [], []])
  game.play
end