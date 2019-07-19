require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer

  def move(game, mark)
    tree = TicTacToeNode.new(game.board, mark)

    # if there is a winning move, return the pos that causes a win
    tree.children.each do |child| 
      if child.winning_node?(mark)
        return child.prev_move_pos
      end
    end

    # if there is no winning move, dont pick the losing move
    tree.children.each do |child| 
      if !child.losing_node?(mark) 
        return child.prev_move_pos
      end
    end

    raise "There are no non-losing nodes."
  end

end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
