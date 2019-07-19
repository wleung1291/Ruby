class My_queue
  attr_accessor :store

  def initialize()
    @store = []
  end

  def peek()
    return store.first if !empty?()
  end
    
  def size()
    return store.length
  end
  
  def empty?()
    return store.empty?
  end
  
  def enqueue(ele)
    store.push(ele)
  end
  
  def dequeue()
    store.shift() if !empty?()
  end

  
end

#que = My_queue.new()
#p que.enqueue(6)
#p que.enqueue(5)
#p que.enqueue(4)
#p que.peek()
#p que.size()
#p que.empty?
#p que.peek() 
#p que.dequeue()
#p que.store