require_relative 'my_stack'
# O(1) time for stack and queue insertion/deletion

class Stack_queue
  attr_accessor :in_stack, :out_stack

  def initialize()
    @in_stack = My_stack.new()
    @out_stack = My_stack.new()
  end

  def size()
    return (in_stack.stack.length + out_stack.stack.length)
  end
  
  def empty?()
    return in_stack.stack.empty? && out_stack.stack.empty?
  end
  
  def enqueue(ele)
    in_stack.stack.push(ele)
  end
  
  def dequeue()
    reverse() if out_stack.stack.empty?()
    # p out_stack
    out_stack.stack.pop if !empty?()
  end

  # Turn a stack into a queue
  def reverse()
    out_stack.stack.push(in_stack.stack.pop) until in_stack.stack.empty?()
  end

end

sq = Stack_queue.new()
sq.enqueue(1)
sq.enqueue(2)
sq.enqueue(3)
p sq.in_stack # [1, 2, 3]
p sq.dequeue() # 1
p sq.out_stack # [3, 2]