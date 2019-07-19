class MaxIntSet
  attr_accessor :max, :store  

  def initialize(max)
    @max = max
    @store = Array.new(max, false)
  end

  def insert(num)
    validate!(num)
    store[num] = true
  end
  
  def remove(num)
    validate!(num)
    store[num] = false
  end
  
  def include?(num)
    validate!(num)
    return store[num]
  end
  
  private 

  def is_valid?(num)
  end
  
  def validate!(num)
    raise "Out of bounds" if num >= max
  
    raise "Out of bounds" if num < 0
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    if include?(num)
      return false 
    else 
      self[num] << num 
      return true
    end
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    return @store[num % num_buckets()]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_accessor :count, :num_buckets

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
    @num_buckets = num_buckets
   
  end

  def insert(num)
    if include?(num)
      return false 
    else 
      self[num] << num 
      @count += 1
      if @count > @num_buckets
        resize!()
      end
      return true
    end
  end

  def remove(num)
    
    if include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    return @store[num % @num_buckets]
  end

  #def num_buckets
  #  @store.length
  #end

  def resize!
    old_store = @store
    @num_buckets = @num_buckets * 2
    @count = 0
    @store = Array.new(@num_buckets) { Array.new }

    old_store.each do |bucket|
      bucket.each do |ele|
        insert(ele)
      end
    end
  end
  
end
