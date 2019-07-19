# takes a start and an end and returns an array of all numbers in that 
# range, exclusive. For example, range(1, 5) should return [1, 2, 3, 4]. 
# If end < start, you can return an empty array.
# 1 + range(2, 5)
# 2 + range(3, 5)
# 3 + range(4, 5)
# 4 + range(5, 5)
# 

def range(start, endI)
    arr = Array.new()
    if endI < start
        p "hello"
        return arr
    end


    if start == endI - 1 
        return arr
    else
        
        arr << start
         range(start + 1, endI)
    end
arr


end

p range(1, 5)
#p range(5, 1)       

##################################################################### 

# Exponent
def exp(b, n)
    return b if n <= 1
    b * exp(b, n-1)
end

#p exp(3, 3) => 27