
class StaticArray
  attr_reader :store
  
  def initialize(capacity)
    @store = Array.new(capacity)
  end
  
  def [](i)
    validate!(i)
    self.store[i]
  end
  
  def []=(i, val)
    validate!(i)
    self.store[i] = val
  end
  
  def length
    self.store.length
  end
  
  private
  
  def validate!(i)
    raise "Overflow error" unless i.between?(0, self.store.length - 1)
  end
end

class DynamicArray
  # Dynamic array that increases 2x in size 
  include Enumerable
  attr_accessor :count, :store, :cap

  def initialize(capacity = 8)
    @store = StaticArray.new(capacity)
    @count = 0
    @cap = capacity
    @first_nil = 0
    @last_ele = 0
  end

  def [](i)
    if i < 0
      return nil if i < -(@count)
      return self[@count + i]
    end

    return @store[i]
  end

  # When inserting into array using index (i.e., arr[i]=val)
  def []=(i, val)  
    # resize array if inserting into index thats greater than length of array
    if i > capacity()
      resize!() until i <= capacity()
    end
    
    # when inserting using negative indexes
    if i < 0
      return nil if i < -(@count)
      self[@count + i] = val
      @count += 1
      return
    else
      @store[i] = val
      @count += 1
    end
  end

  def capacity
    @store.length
  end

  def include?(val)
    return @store.store.include?(val)
  end

  # arr << into the first non-nil index
  def push(val)
    if @count >= capacity()
      resize!()
    end
    @store.store.each_with_index do |ele, i|
      if ele == nil 
        @first_nil = i
        break
      end
    end
    @store[@first_nil] = val
    @count += 1
  end

  # add items to the beginning of the array and shift others over
  # ruby's unshift method runs at O(1) time
  def unshift(val)
    if @count >= @cap
      resize!()
    end
    @store.store.unshift(val)
    @count += 1
  end
  
  # remove the last item
  def pop
    return nil if @count == 0

    # get the index of the las titem
    @store.store.reverse.each_with_index do |ele, i|
      if ele != nil 
         @last_ele = capacity() - (i+1) 
         break
      end
    end
    #val = @store.store.delete_at(@last_ele)
    val = @store.store[@last_ele]
    @store.store[@last_ele] = nil
    @count -= 1
    return val
  end

  # Remove from the front, changes element to nil and decrements count
  def shift
    @store.store.each_with_index do |ele, i|
      if ele != nil
        val = ele
        @store.store[i] = nil
        @count -= 1
        return val
      end
    end

    return nil if @count == 0
  end

  def first
    return @store.store.first
  end

  def last   
    return @store.store[count-1]
  end

  def each
    @store.store.each do |ele|
      yield ele
    end
  end

  def to_s
    "[" + inject([]) { |acc, el| acc << el }.join(", ") + "]"
  end

  def ==(other)
    return false unless [Array, DynamicArray].include?(other.class)
    return false unless length == other.length

    @store.store.each_with_index do |ele, i| 
      return false unless ele == other[i]
    end
    
    return true 
  end

  alias_method :<<, :push
  [:length, :size].each { |method| alias_method method, :count }

  private

  def resize!
    old_store = @store
    @cap = capacity() * 2
    @store = StaticArray.new(@cap)

    (0..old_store.length-1).each do |i|
        @store[i] = old_store[i]
    end
  end
end
