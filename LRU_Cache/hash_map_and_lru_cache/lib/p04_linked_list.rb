class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    if self.prev == nil 
      self.next.prev = nil
      self.next = nil
    elsif self.next == nil
      self.prev.next = nil
      self.prev = nil
    else
      self.prev.next = self.next
      self.next.prev = self.prev
    end

    return self
  end
end

class LinkedList
  include Enumerable

  attr_reader :head, :tail
  def initialize
    @head = Node.new()
    @tail = Node.new()

    @head.next = @tail
    @tail.prev = @head
  end
  
  def [](i)
    each_with_index { |link, j| return link if i == j }
  end
  
  # return the first node
  def first
    if empty?() 
      return nil 
    else
      return @head.next 
    end
  end
    
  # return the last node
  def last
    if empty?() 
      return nil
    else
      return @tail.prev 
    end
  end
  
  def empty?
    return @head.next == @tail
  end
  
  # returns the val of the node
  def get(key)
    self.each do |node| 
      if node.key == key 
        return node.val
      end
    end
  end
  
  def include?(key)
    self.each do |node|
      if node.key == key
        return true
      end
    end

    return false
  end
  
  # append to the tail of the linked list
  def append(key, val)
    node = Node.new(key, val)
     
    @tail.prev.next = node
    node.prev = @tail.prev
    @tail.prev = node
    node.next = @tail

    return node # Used for LRU Cache
  end

  # update the val of the node 
  def update(key, val)
    self.each do |node|
      if node.key == key
        node.val = val
      end
    end
  end

  # remove the specific node from the linked list
  def remove(key)
    self.each do |node|
      if node.key == key
        node.prev.next = node.next
        node.next.prev = node.prev
        node.remove
        return node.val
      end
    end
  end

  # The block passed to #each will yield a node
  def each
    node = @head.next
    while node != @tail
      yield node
      node = node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end

