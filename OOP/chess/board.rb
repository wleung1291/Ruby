require_relative "pieces/piece"

class Board

  def initialize(set_board = true)
    @board = Array.new(8){ Array.new(8)}
    populate() if set_board
  end

  def move_piece(start_pos, end_pos)

  end

  def populate

  end
end