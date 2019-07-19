require_relative 'p04_linked_list'

# Incorporate our linked list into our hash buckets. Instead of Arrays, we'll 
# use LinkedLists for our buckets. Each linked list will start out empty. 

class HashMap
  include Enumerable
  attr_accessor :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    return bucket(key).include?(key)    
  end

  def set(key, val)
    if include?(key)
      bucket(key).update(key, val)
    else
      bucket(key).append(key, val)
      @count += 1
      if @count > num_buckets()
        resize!()
      end
    end
  end

  def get(key)
    return bucket(key).get(key)
  end

  def delete(key)
    @count -= 1 if bucket(key).remove(key)
  end

  def each
    @store.each do |bucket|
      bucket.each do |node|
        yield [node.key, node.val]
      end
    end
  end

   # uncomment when you have Enumerable included
   def to_s
     pairs = inject([]) do |strs, (k, v)|
       strs << "#{k.to_s} => #{v.to_s}"
     end
     "{\n" + pairs.join(",\n") + "\n}"
   end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store
    @count = 0
    @store = Array.new(num_buckets * 2) { LinkedList.new }

    old_store.each do |bucket|
      bucket.each do |node|
        set(node.key, node.val)
      end
    end
  end

  # Returns the bucket(Linked List)
  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
    return @store[key.hash % num_buckets()]
  end
end
