require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :map, :store, :max, :prc

  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  # checks if key exists in the lru cache
  def get(key)
    if @map[key]
      update_node!(@map[key])
    else
      calc!(key)
    end
  end

  def to_s
    'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
  end

  private

  # suggested helper method; insert an (un-cached) key
  def calc!(key)
    value = prc.call(key)
    # Point a hash key to the appended node at the end of the linkedlist  
    @map[key] = @store.append(key, value)
    
    if count() > max  
      eject!()
    end
  end

  # Update a cached key; move the node to the end of the list
  def update_node!(node)
    node.remove()
    @store.append(node.key, node.val)
  end

  # If cache is full, eject the least recently used key
  def eject!
    node = @store.head.next
    node.remove()
    @map.delete(node.key)
  end
end

# View of a LRU Cache - Hashmap w/ LinkedList: 
# lru = {
#                Nil
#                 ^           
#               Head
#              p <=> n  
#   key1 => [key1: val1],
#              p <=> n
#   key2 => [key2: val2],
#              p <=> n
#   key3 => [key3: val3],
#              p <=> n
#               Tail
#                 v
#                Nil
# }

# prc = Proc.new{ |num| num ** 2 }
# lru = LRUCache.new(3, prc)
# lru.get(1)
# lru.get(2)
# lru.get(3)
# lru.get(4)
# lru.get(2)
# 
# puts lru.map
# puts lru.store