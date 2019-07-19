require_relative 'tic_tac_toe'

class TicTacToeNode

  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    if board.over?
      # if winner is not nil and winner is the opponent
      if board.won? && board.winner != evaluator
        return true
      else 
        return false
      end
    end

    # It is the player's turn
    if next_mover_mark == evaluator
      # return if all the children nodes are losers for the player 
      return self.children.all? { |child| child.losing_node?(evaluator)}
    else
      # It is the opponent's turn, and one of the children nodes is a 
      # losing node for the player 
      return self.children.any? { |child| child.losing_node?(evaluator) }
    end
  end

  def winning_node?(evaluator)
    if board.over?
      # if winner is not nil and winner is us 
      if board.won? && board.winner == evaluator
        return true
      else 
        return false
      end
    end

    # It is the player's turn
    if next_mover_mark == evaluator
      # return if one of the children nodes is a winning node for the player 
      return self.children.any? { |child| child.winning_node?(evaluator)}
    else
      # It is the opponent's turn, and all of the children nodes are winning 
      # nodes for the player 
      return self.children.all? { |child| child.winning_node?(evaluator)}
    end
  end

  # This method generates an array of all moves(children) that can be made after
  # the current move.
  def children
    moves = []
    (0..2).each do |r|
      (0..2).each do |c|
        if board.empty?([r, c])
          dup_board = board.dup

          dup_board[[r, c]] = next_mover_mark
          if next_mover_mark == :x
            next_mover_mark = :o
          else
            next_mover_mark = :x
          end

          moves << TicTacToeNode.new(dup_board, next_mover_mark, [r, c])
          p moves
        end
      end
    end

    return moves
  end

  
end
