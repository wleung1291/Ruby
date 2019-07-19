class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    self.each.inject(0) do |result, ele| 
       ele.hash ^ result.hash
    end
  end
end

class String
  def hash
    self.each_char.inject(0) do |result, ele| 
      (ele.ord).hash ^ result.hash
    end
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    self.each.inject(0) do |result, ele|
      ele.hash ^ result
    end
  end
end
