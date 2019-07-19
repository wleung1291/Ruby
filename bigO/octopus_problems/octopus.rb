class Octopus
  # Big O-ctopus and Biggest Fish
  # A Very Hungry Octopus wants to eat the longest fish in an array of fish.
  FISH = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 
  'fiiiissshhhhhh', 'fsh', 'fisssssh'] 
 
  # Sluggish Octopus
  # Find the longest fish in O(n^2) time. Do this by comparing all fish lengths 
  # to all other fish lengths
  def quadratic()
    FISH.each_with_index do |el, i|
      max_len = true
      p el
      FISH.each_with_index do |el2, j|
        p el2
        next if i == j
        if el.length < el2.length
          max_len = false 
        end
      end
      return el if max_len
    end
  end

  # Dominant Octopus
  # Find the longest fish in O(n log n) time. Hint: You saw a sorting algorithm 
  # that runs in O(n log n) in the Sorting Complexity Demo. Remember that Big O 
  # is classified by the dominant term. Merge-Sort
  def log_linear(array)
    if array.length <= 1
      return array
    else
      mid = (array.length / 2)
      left = log_linear(array[0...mid])
      right = log_linear(array[mid..array.length])
      merge(left, right)
    end
end

def merge(left, right)
  if left.empty?
    return right
  elsif right.empty?
    return left
  elsif left[0].length < right[0].length
    [left[0]] + merge(left[1..left.length], right)
  else
    [right[0]] + merge(left, right[1..right.length])
  end
end


  # Clever Octopus
  # Find the longest fish in O(n) time. The octopus can hold on to the longest 
  # fish that you have found so far while stepping through the array only once.
  def linear()
    longest = FISH[0]

    (1...FISH.length).each do |i|
      fish = FISH[i]
      longest = fish if longest.length < fish.length 
    end

    return longest
  end

  arr = Octopus.new()
  p arr.log_linear(FISH)
end
  #----------------------------------------------------------------------------#
  # Dancing Octopus
  # Full of fish, the Octopus attempts Dance Dance Revolution. The game has 
  # tiles in the following directions:
  
  # To play the game, the octopus must step on a tile with her corresponding 
  # tentacle. We can assume that the octopus's eight tentacles are numbered and 
  # correspond to the tile direction indices.
  TILES_ARRAY= ["up", "right-up", "right", "right-down", "down", "left-down", 
    "left",  "left-up" ]
  
  # Slow Dance
  # Given a tile direction, iterate through a tiles array to return the tentacle 
  # number (tile index) the octopus must move. This should take O(n) time.
  def slow_dance(tile, arr)
    arr = TILES_ARRAY
    arr.each_with_index do |direction, i|
      return i if tile == direction
    end
    return nil
  end

  #p slow_dance("up", TILES_ARRAY)
  # > 0
  #p slow_dance("right-down", TILES_ARRAY)
  # > 3
  

  # Constant Dance!
  # Now that the octopus is warmed up, let's help her dance faster. Use a 
  # different data structure and write a new function so that you can access the 
  # tentacle number in O(1) time.
  new_tiles_data_structure = {"up"=>1, "right-up"=>2, "right"=>3, 
    "right-down"=>4, "down"=>5, "left-down"=>6, "left"=>7, "left-up"=>8}

  def fast_dance(tile, new_tiles_data_structure)
    return new_tiles_data_structure[tile]
  end

  #p fast_dance("up", new_tiles_data_structure)
  # > 1
  #p fast_dance("right-down", new_tiles_data_structure)
  # > 4

