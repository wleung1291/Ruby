require_relative 'my_stack'

class Min_max_stack
  attr_accessor :stack

  def initialize()
    @stack = My_stack.new()
  end

  def peek()
    return stack.stack.last[:ele] if !empty?()
  end
    
  def size()
    return stack.stack.length
  end
  
  def empty?()
    return stack.stack.empty?
  end
  
  # each element in the stack is a hash with max, min, ele value-key pairs
  def push(ele)
    stack.stack.push({
      max: empty? ? ele : [max, ele].max,
      min: empty? ? ele : [min, ele].min,
      ele: ele
    })
  end
  
  # stack deletion takes O(1)
  def pop()
    stack.stack.pop if !empty?
  end
  
  # O(1) time for hash search
  def min()
    return stack.stack.last[:min]
  end
  
  def max()
    return stack.stack.last[:max]
  end
  
end


