# Given an array of unique integers and a target sum, determine whether any 
# two integers in the array sum to that amount.

# Brute Force
# check every possible pair. If we sum each element with every other, we're 
# sure to either find the pair that sums to the target, or determine that no 
# such pair exists.
# O(n^2) time because loops through the array of size n in a nested loop 
# O(1) space bc allocate memory for sum which takes the same byte size
def bad_two_sum?(arr, target_sum)
  sum = 0

  arr.each_with_index do |ele1, i1|
    (i1+1...arr.length).each do |i2|
      sum = ele1 + arr[i2]
      return true if sum == target_sum
    end
  end

  return false
end


# Sorting - Binary Search
# O(n log n) time bc looping though an array of size O(n) and using 
#   binary search O(log n) inside the loop
# O(n) space bc aloocate space for the binary search
def okay_two_sum?(arr, target_sum)
  arr = arr.sort
  
  arr.each_with_index do |ele, i|
    match_i = arr.bsearch_index { |ele2| (target_sum - ele) <=> ele2 }
    return true if match_i && match_i != i
  end

  return false
end

arr = [0, 1, 5, 7]
p okay_two_sum?(arr, 10)

# Hash map
# O(n) time bc loops through an array of size n. 
#   hash.has_value?() and hash.key() run at O(1) constant time 
# O(n) space bc allocate memory for a hash table
def good_two_sum?(arr, target_sum)
  hash = {}

  arr.each_with_index do |ele, i|
    hash[i] = ele
  end

  arr.each_with_index do |ele, i|
    if hash.has_value?(target_sum - ele) # check if the difference exists
      # check if the diff is not at the same index as the ele
      if hash.key(target_sum - ele) != i  
        return true 
      end
    end
  end

  return false
end


#arr = [0, 1, 5, 7]
#p good_two_sum?(arr, 6) # => should be true
#p good_two_sum?(arr, 10) # => should be false
#p good_two_sum?(arr, 7)