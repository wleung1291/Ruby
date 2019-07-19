require_relative 'min_max_stack'

class Min_max_stack_queue
  attr_accessor :in_stack, :out_stack

  def initialize()
    @in_stack = Min_max_stack.new()
    @out_stack = Min_max_stack.new()
  end

  def size()
    return in_stack.stack.size + out_stack.stack.size
  end
  
  def empty?()
    return in_stack.stack.empty? && out_stack.stack.empty?
  end
  
  # each element in the stack is a hash with max, min, ele value-key pairs
  def enqueue(ele)
    in_stack.stack.push(ele)
  end
  
  # stack deletion takes O(1)
  def dequeue()
    reverse() if out_stack.stack.empty?

    out_stack.stack.pop if !empty?
  end
  
  # O(1) time to find min and max
  def min()
    mins = []
    mins << in_stack.stack.stack.min unless in_stack.stack.stack.empty?
    mins << out_stack.stack.stack.min unless out_stack.stack.stack.empty?
    mins.min
  end

  def max()
    maxes = []
    maxes << in_stack.stack.stack.max unless in_stack.stack.stack.empty?
    maxes << out_stack.stack.stack.max unless out_stack.stack.stack.empty?
    maxes.max
  end

  # change stack to a queue by reversing the stack. Only called when 
  #   out_stack is empty and dequeueing
  def reverse()
    out_stack.stack.push(in_stack.stack.pop) until @in_stack.empty?
  end
  
end

#mms = Min_max_stack_queue.new()
#mms.enqueue(1)
#mms.enqueue(2)
#mms.enqueue(3)
#mms.dequeue
#p mms.in_stack.stack
#p mms.out_stack.stack
#p mms.size()
#mms.enqueue(9)
#p mms.in_stack.stack
#p mms.out_stack.stack
#p mms.size()
#p mms.min
#p mms.max
