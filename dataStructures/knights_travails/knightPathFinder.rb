require_relative "polyTreeNode"

class KnightPathFinder

  attr_reader :considered_positions

  def initialize(pos)
    @root_node = PolyTreeNode.new(pos) # Starting position
    @considered_positions = [pos] #track visited positions
    build_move_tree()
  end
  
  # Finds NEW positions you can move to from a given position
  def new_move_positions(pos)
    moves = KnightPathFinder.valid_moves(pos)
    valid_moves = []

    moves.each do |move|
      # Look for positions that have not been visited
      if !considered_positions.include?(move)
        valid_moves << move
        considered_positions << move # mark as visited
      end
    end

    return valid_moves
  end
  
  # Find up to 8 possible moves a knight chess piece can move
  def self.valid_moves(pos)
    row, col = pos
    valid_moves = []
    moves = [
      [row + 1, col + 2], [row + 1, col - 2], [row - 1, col + 2], 
      [row - 1, col - 2], [row + 2, col + 1], [row + 2, col - 1],
      [row - 2, col + 1], [row - 2, col - 1]
    ]

    moves.each do |move|
      valid_moves << move if move[0].between?(0, 7) && move[1].between?(0,7)
    end
    
    return valid_moves
  end

  # Build tree using Breadth-first manner to ensure shortest path
  def build_move_tree
    queue = [@root_node]

    until queue.empty?
      # Start at the root and find possible positions (child nodes) to move to
      curr_node = queue.shift
      valid_pos = new_move_positions(curr_node.value)

      valid_pos.each do |pos|
        child = PolyTreeNode.new(pos)
        curr_node.add_child(child) # Build the tree with the child nodes
        queue << child
      end
    end

    return @root_node
  end
  
  # Finds the path to the end position
  def find_path(end_pos)
    end_node = @root_node.bfs(end_pos)
    trace_path_back(end_node)
  end

  # Trace back each child's parent to get the path
  def trace_path_back(end_node)
    path = [end_node.value]

    curr_node = end_node
    until curr_node.parent.nil?
      path << curr_node.parent.value
      curr_node = curr_node.parent
    end

    return path.reverse
  end

  ############################################################################

  # kpf = KnightPathFinder.new([0,0])
  # p kpf.find_path([7,6])
  # p kpf.find_path([6,2])
end
