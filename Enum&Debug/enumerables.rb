class Array

    # Takes a block, calls the block on every element of the array, 
    # and returns the original array.
    def my_each(&prc)
        self.length.times do |ele|
            #p "hello #{ele}"
            prc.call(self[ele])

        end
        return self
    end
    
    # call
    #return_value = [1, 2, 3].my_each do |num|
    #    puts num
    #end.my_each do |num|
    #    puts num
    #end
    
    #######################################################################
    # Takes a block and returns a new array containing only elements that 
    # satisfy the block. Use your my_each method.
    def my_select(&prc)
        selected = []

        self.each do |ele|
            if prc.call(ele)
                selected << ele
            end
        end

        return selected
    end

    #a = [1, 2, 3]
    #a.my_select { |num| num > 1 } # => [2, 3]
    #a.my_select { |num| num == 4 } # => []

    #######################################################################
    # take a block and return a new array excluding elements that satisfy the block.
    def my_reject(&prc)
        rejected = []

        self.each do |ele|
            if !prc.call(ele)
                rejected << ele
            end
        end

        return rejected
    end

    #a = [1, 2, 3]
    #a.my_reject { |num| num > 1 } # => [1]
    #a.my_reject { |num| num == 4 } # => [1, 2, 3]

    #######################################################################
    # Write my_any? to return true if any elements of the array satisfy the block 
    # and my_all? to return true only if all elements satisfy the block.
    def my_any?(&prc)
        self.each do |ele|
            if prc.call(ele)
                return true
            end
        end 

        return false
    end

    def my_all?(&prc)
        self.each do |ele|
            if !prc.call(ele)
                return false
            end 
        end

        return true
    end

    #   a = [1, 2, 3]
    #   a.my_any? { |num| num > 1 } # => true
    #   a.my_any? { |num| num == 4 } # => false
    #   a.my_all? { |num| num > 1 } # => false
    #   a.my_all? { |num| num < 4 } # => true

    #######################################################################
    # my_flatten should return all elements of the array into a new, 
    # one-dimensional array. Hint: use recursion!

    def my_flatten
        arr = []
        #p arr
        #p "SELF #{self}"
        self.each do |ele|
            #p arr
            if ele.is_a?(Array)
                #p "SUBARR: #{ele}"
                #p "ONE #{arr}"
                arr += ele.my_flatten 
                #p "TWO #{arr}"
            else
                arr << ele
                #p arr
            end
        end
        return arr
    end

    # p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

    #######################################################################


    #######################################################################
    # Write a method my_rotate that returns self rotated. By default, the array should 
    # rotate by one element. If a negative value is given, the array is rotated in 
    # the opposite direction.
    def my_rotate(rotate = 1)   
        # push and pop are O(1) constant time b/c moving the pointer and 
        # inserting and deleting elements, n.times is O(n) time because 
        # it acts like a for-loop and iterates n times.
        
        #if rotate > 0
        #    rotate.times do 
        #        rem_front = self.shift()
        #        self.push(rem_front)
        #    end 
        #else
        #    rotate.abs.times do 
        #        rem_end = self.pop()
        #        self.unshift(rem_end)
        #    end
        #end
        #p self

        # O(1) constant time because removes or takes n number of elements
        rotate = rotate % self.length 
        p self.drop(rotate) + self.take(rotate)
    
    end

    #a = [ "a", "b", "c", "d" ]
    #a.my_rotate         #=> ["b", "c", "d", "a"]
    #a.my_rotate(2)      #=> ["c", "d", "a", "b"]
    #a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
    #a.my_rotate(15)     #=> ["d", "a", "b", "c"]

    #######################################################################
    # my_join returns a single string containing all the elements of the array, 
    # separated by the given string separator. If no separator is given, 
    # an empty string is used.

    def my_join(str = "")
        join = ""
     
        (0...self.length).each do |i|
            join += self[i]
            join += str unless i == self.length - 1
        end

        p join
        return join
    end

    #a = [ "a", "b", "c", "d" ]
    #a.my_join         # => "abcd"
    #a.my_join("$")    # => "a$b$c$d"

    #######################################################################
    # Write a method that returns a new array containing all the elements of 
    # the original array in reverse order.
    def my_reverse
        reverse = []

        # Implementation 1
        # O(n) because iterates through a loop n times and the operations 
        # inside the loop take constant time
        i  = self.length - 1
        while(i >= 0) 
            reverse << self[i] 
            i -= 1
        end
     
        # Implementation 2
        # O(n) time because iterates through an array and operation take O(c).
        # O(1) space b/c given a fixed array of N elements to reverse 
        #self.my_each do |ele|
        #    reverse.unshift(ele)
        #end
        
        return reverse
    end

    #[ "a", "b", "d", "c", "d" ].my_reverse #=> [ "d", "c", "b", "a" ]
    #[ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
    #[ 1 ].my_reverse               #=> [1]

    #######################################################################

    def factors_of(num)
        factor = []
        (1..num).each do |i|
            if num % i == 0
                factor << i 
            end
        end
  
        return factor
    end
 
    object = Array.new
    #p object.factors_of(10)  #=>[1, 2, 5, 10]
    #factors(13)    #[1, 13]

    #######################################################################

    # Best Case O(n) time if already sorted because still needs to loop through array 
    # to check of sorted. Worst case and average O(n^2) because have to run 
    # through array n amount of times.
    # O(1) space because changes the same array in place
    def bubble_sort!(&prc)
        n = self.length
      
        until n <= 1 
            swap = false

            (0...self.length-1).each do |i|
                if self[i] > self[i+1] 
                    self[i], self[i+1] = self[i+1], self[i]
                    swap = true
                end
            end

            n -= 1
            break if swap == false
        end

        return self
    end

    #array = [1,2,3,4,5,6].shuffle
    #p array.bubble_sort!

    #######################################################################
    # Return valid substrings
    # O(n^3) time b/c 3 loops nested. The most inner loop comes from a call to 
    # contain? the operation inside the while loop is a hash insertion O(c).
    # The second O(n) loop's operations are concating a string O(c), inserting into an
    # array O(c), and calls contain?.   
    # O(n) space b/c 
    def substrings(string, dictionary)      
        substr = []
        
        dictionary.each do |word|
            hash = Hash.new(0)
            str = ""
            word.each_char do |char|
                hash = contain?(string, char, hash.values[0]) 
                if hash.empty?
                    str = ""
                    break
                else 
                    str += char
                end
            end
            if str == word
              substr << str
            end 
        end

        return substr
    end

     # returns a hash of the char and the index it was found
    def contain?(string, char, index)
        if index == nil
          i = 0
        else
          i = index
        end
        hash = Hash.new(0)
        while i < string.length
            if string[i] == char
                hash[char] = i
                break
            end
            i += 1
        end
    
        return hash
    end
    #p object.substrings("asdfcatqwer", ["cat", "cats", "catg", "car"] )     # ["cat", "car"]
    #p object.substrings("batcabtarbrat", ["cat", "car"] )                   # ["cat", "car"]
    #p object.substrings("erbearsweatmyajs", ["bears", "ear", "a", "army"])  #[ "bears", "ear", "a", "army"]

    #######################################################################
    # note that the method should NOT return duplicate words

    def subwords(word, dictionary)
        arr = []
        subwords = []
        i = 0
        while i < word.length
            str = word[i]
            j = i + 1
            while j < word.length
                arr << str
                str += word[j]
                j += 1
            end 
            i += 1
        end
        
        dictionary.each do |ele|
            if arr.include?(ele)
                subwords << ele
            end
        end

        p arr 
        p subwords
        return subwords
    end
    
    #p object.subwords("asdfcatqwer", ["cat", "car"] )    # ["cat"]
    #p object.subwords("batcabtarbrat", ["cat", "car"] )  # to be empty
    #p object.subwords("erbearsweatmyajs", ["bears", "ear", "a", "army"])   #[ "bears", "ear", "a"]
end
