require 'set'

class LRUCache
    attr_accessor :cache, :max_size

    def initialize(size)
      @max_size = size
      @cache = Array.new()
    end

    # returns number of elements currently in cache
    def count
      return cache.size
    end

    # adds element to cache according to LRU principle
    def add(el)
      if cache.include?(el)
        remove_dup(el)
      end
      
      if cache.count >= max_size
        remove()
      end

      cache << el
    end

    # shows the items in the cache, with the LRU item first
    def show
      return cache
    end

    # helper methods go here!
    def remove()
      cache.shift
    end

    def remove_dup(el)
      cache.delete(el)
    end
end


  #johnny_cache = LRUCache.new(4)
  #johnny_cache.add("I walk the line")
  #johnny_cache.add(5)

  #p johnny_cache.count # => returns 2

  #johnny_cache.add([1,2,3])
  #johnny_cache.add(5)
  #johnny_cache.add(-5)
  #johnny_cache.add({a: 1, b: 2, c: 3})
  #johnny_cache.add([1,2,3,4])
  #johnny_cache.add("I walk the line")
  #johnny_cache.add(:ring_of_fire)
  #johnny_cache.add("I walk the line")
  #johnny_cache.add({a: 1, b: 2, c: 3})

  #p johnny_cache.show 
  ## => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]