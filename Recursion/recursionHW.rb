# Calculate the sum from 1 to n (inclusive of n).
def sum_to(n)           #0  sum_to(5)         #10  15
    return n if n <= 1  #1  5 + sum_to(4)     #9   5 + 10 = 15
    n + sum_to(n-1)     #2  4 + sum_to(3)     #8   4 + 6 = 10   
end                     #3  3 + sum_to(2)     #7   3 + 3 = 6
                        #4  2 + sum_to(1)     #6   2 + 1 = 3
                        #5  1              =^

#p sum_to(5)  # => returns 15
#p sum_to(1)  # => returns 1
#p sum_to(9)  # => returns 45

#############################################################################

# Takes in an array of Integers and returns the sum of those numbers. 
# arr = [1, 2, 3, 4, 5]
# arr[0] + arr[1..-1]

def add_numbers(nums_array)
    return nums_array[0] if nums_array.length <= 1
    n = nums_array[0] + add_numbers(nums_array[1..-1])
end

#p  add_numbers([1,2,3,4]) # => returns 10
#p  add_numbers([3]) # => returns 3
#p  add_numbers([-80,34,7]) # => returns -39
#p  add_numbers([]) # => returns nil

#############################################################################

# The Gamma Function is defined Γ(n) = (n-1)!.

def  gamma_fnc(n)
    return n if n <= 1
    n = n - 1
    n * gamma_fnc(n)
end

# p  gamma_fnc(0)  # => returns nil
# p  gamma_fnc(1)  # => returns 1
# p  gamma_fnc(4)  # => returns 6
# p  gamma_fnc(8)  # => returns 5040
#############################################################################
# Takes in an array of ice cream flavors available at the ice cream shop, 
# as well as the user's favorite ice cream flavor. Recursively find out whether
# or not the shop offers their favorite flavor.
#

def ice_cream_shop(flavors, favorite)   
    offers = flavors[0] == favorite   
    return offers if offers == true
    return offers if flavors.length <= 1
    ice_cream_shop(flavors[1..-1], favorite)
end

#p  ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')  # => returns false
#p  ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 
#    'green tea')  # => returns true
#p  ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 
#    'sea salt caramel'], 'pistachio')  # => returns false
#p  ice_cream_shop([], 'honey lavender')  # => returns false
#p  ice_cream_shop(['moose tracks'], 'moose tracks')  # => returns true


#############################################################################

# Takes in a string and returns it reversed.
# str = "Hello"
# "o" + "Hell"
# "l" + "Hel"
def reverse(string)
    return string if string.length <= 1
    string[-1] + reverse(string[0..-2])
end
# p  reverse("house") # => "esuoh"
# p  reverse("dog") # => "god"
# p  reverse("atom") # => "mota"
# p  reverse("q") # => "q"
# p  reverse("id") # => "di"
# p  reverse("") # => ""


############################################################################# 

# Exponent
def exp(b, n)
    return b if n <= 1
    b * exp(b, n-1)
end

#p exp(3, 3) => 27

#############################Incomplete#######################################

# takes a start and an end and returns an array of all numbers in that 
# range, exclusive. For example, range(1, 5) should return [1, 2, 3, 4]. 
# If end < start, you can return an empty array.
# 1 + range(2, 5)
# 2 + range(3, 5)
# 3 + range(4, 5)
# 4 + range(5, 5)
# 

def range(start, endI)
    arr = []
    if start > endI
        return []
    end

    if start <= endI - 1
        arr << start
        p arr
    end
       range(start + 1, endI)
    
end

#p range(1, 5)
#p range(5, 1)       

#############################################################################

# Have array of integers. Write a recursive solution to determine whether or not 
# the array contains a specific value.

def contain?(arr, val)

    if arr.length == 0
        return false
    elsif val == arr[0]
        return true
    else 
        contain?(arr[1..-1], val)
    end
end

#p contain?([1, 2, 3, 4, 5], 3)
#contain?([1, 2, 3, 4, 5], 6)

#############################################################################

# Have an unsorted array of integers. Write a recursive solution to count the 
# number of occurrences of a specific value.

def count(arr, val)
    if arr.length == 0
        return 0
    end

    if val == arr[0] 
        cnt = 1
    else 
        cnt = 0
    end
    
    cnt + count(arr[1..-1], val)
end

#p count([1, 2, 3, 4, 4, 4,  5], 4)

#############################################################################

# You have array of integers. Write a recursive solution to determine whether 
# or not two adjacent elements of the array add to 12.

def adj_12(arr)
    if arr.length <= 1
        return false
    elsif (arr[0] + arr[1]) == 12
        return true
    else
        adj_12( arr[1..-1] )
    end
end

# p adj_12([1,2,5,8,8,4])
#############################################################################

# You have array of integers. Write a recursive solution to determine if the 
# array is sorted.

def sorted?(arr)
    if arr.length <= 1
        return true
    elsif arr[0] > arr[1]
        return false
    else
        sorted?( arr[1..-1] )
    end
   
end

# p sorted?([1,2,3,4,5])
# p sorted?([1,2,5,4,3])


# SOLUTIONS:

#Problem 1: You have array of integers. Write a recursive solution to find the
#sum of the integers.

# def sum_recur(array)
#   return 0 if array.empty?
#   sum_recur(array.drop(1)) + array.first
# end
# 
# #Problem 2: You have array of integers. Write a recursive solution to determine
# #whether or not the array contains a specific value.
# 
# def includes?(array, target)
#   return false if array.empty?
#   return true if array.first == target
#   includes?(array.drop(1), target)
# end
# 
# # Problem 3: You have an unsorted array of integers. Write a recursive solution
# # to count the number of occurrences of a specific value.
# 
# def num_occur(array, target)
#   return 0 if array.empty?
#   count_update = array.first == target ? 1 : 0
#   count_update + num_occur(array.drop(1), target)
# end
# 
# # Problem 4: You have array of integers. Write a recursive solution to determine
# # whether or not two adjacent elements of the array add to 12.
# 
# def add_to_twelve?(array)
#   return false if array.length <= 1
#   return true if array[0] + array[1] == 12
#   add_to_twelve?(array.drop(1))
# end
# 
# # Problem 5: You have array of integers. Write a recursive solution to determine
# # if the array is sorted.
# 
# def sorted?(array)
#   return true if array.length <= 1
#   return false if array[0] > array[1]
#   sorted?(array.drop(1))
# end
# 
# # Problem 6: Write a recursive function to reverse a string. Don't use any
# # built-in #reverse methods!
# 
# def reverse(string)
#   return string if string.length <= 1
#   string[-1] + reverse(string.slice(1, string.length - 2)) + string[0]
# end


