
# Given a list of integers find the smallest number in the list.

# O(n^2) time because iterates through two arrays in a nested loop
# O(n) space because creates an array of input size 
def my_min(list)
  dup_list = list.dup

  list.each do |ele1|
    dup_list.delete(ele1)
    if dup_list.all? { |ele2| ele2 > ele1 }
      return ele1
    end
  end
end

# O(n^2) time because loops through arrays of size n in a nested loop
# O(1) space because size of variables created stay constant
def my_min2(list)
  list.each_with_index do |ele1, i1|
    min = true
    list.each_with_index do |ele2, i2|
      next if i1 == i2
      min = false if ele2 < ele1
    end

    return ele1 if min
  end
end

#list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
#p my_min2(list)  # =>  -5

###############################################################################

# You have an array of integers and you want to find the largest contiguous 
# (together in sequence) sub-sum. Find the sums of all contiguous sub-arrays 
# and return the max.

# O(n^2) time bc looping through 2 loops of size n in a nested loop
# O(n^3) space bc allocates space for two arrays. Also allocates space for array 
#   when looping through sub_arrays
def largest_contiguous_subsum1(list)
  sub_arrays = []

  list.each_with_index do |ele1, i1|
    (i1...list.length).each do |i2|
      sub_arrays << list[i1..i2]
    end
  end
  
  sums = []
  sub_arrays.each do |array|
    sums <<  array.inject{ |sum, n| sum + n}
  end

  return sums.max
end

# O(n) time
# O(1) space
def largest_contiguous_subsum2(list)
  largest = arr.first
  current = arr.first

  return arr.max if arr.all? { |num| num < 0 }

  arr.drop(1).each do |num|
    current = 0 if current < 0
    current += num
    largest = current if current > largest
  end

  largest
end


list1 = [5, 3, -7]  # => 8
list2 = [2, 3, -6, 7, -6, 7] # => 8 (from [7, -6, 7])
list3 = [-5, -1, -3] # => -1 (from [-1])
p largest_contiguous_subsum2(list2) 