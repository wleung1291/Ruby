require_relative 'min_max_stack_queue'

# Given an array, and a window size w, find the maximum range (max - min) 
# within a set of w elements.

# Naive Solution
# O(n * m) time bc loop through array of size n while slicing the arr at size m
# O(n^2) time for Ruby's min and max functions
# O(n) space since .each_cons allocates temp space for each slice
def max_windowed_range(arr, window)
  current_max_range = nil

  arr.each_cons(window) do |slice| 
    current_range = slice.max - slice.min
    if current_max_range == nil || current_max_range < current_range
      current_max_range = current_range
    end
  end

  return current_max_range
end


# Optimized Solution
#  O(n) time bc looping through an array of size n. Enqueue, dequeue, min, and
#   max take O(1) constant time. 
def max_windowed_range_op(arr, window)
  queue = Min_max_stack_queue.new()
  max_range = nil

  arr.each do |ele|
    queue.enqueue(ele)

    if queue.size > window
      queue.dequeue()
    end

    if queue.size == window
      current_range = queue.max - queue.min
      if max_range == nil || max_range < current_range
        max_range = current_range
      end
    end
  end

  return max_range
end

# p max_windowed_range_op([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
# p max_windowed_range_op([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
# p max_windowed_range_op([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
# p max_windowed_range_op([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8