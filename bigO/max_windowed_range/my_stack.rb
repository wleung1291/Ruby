class My_stack
  attr_accessor :stack

  def initialize()
    @stack = []
  end

  def peek()
    return stack.first if !empty?()
  end
    
  def size()
    return stack.length
  end
  
  def empty?()
    return stack.empty?
  end
  
  def push(ele)
    stack.push(ele)
  end
  
  def pop()
    stack.pop() if !empty?()
  end

end

#stack = My_stack.new()
#p stack.push(1)
#p stack.push(2)
#p stack.push(3)
#p stack.peek
#p stack.empty?
#p stack.size
#p stack.pop
#p stack.stack