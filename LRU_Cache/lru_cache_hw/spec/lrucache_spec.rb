require 'rspec'
require './lrucache'

describe LRUCache do
  let(:cache) {LRUCache.new(4)}

  describe "#initialize" do
    it "sets max_size to 4" do
      expect(cache.max_size).to eq(4)
    end
  end

  describe "#add" do
    it "adds an element into the cache" do
      cache.add("foo")
      expect(cache.cache).to eq(["foo"])
    end
    
    it "calls remove_dup when adding a duplicate element" do
      expect(cache).to receive(:remove_dup).with("foo")
      cache.add("foo")
      cache.add("foo")
    end

    it "calls remove when the cache is full" do
      expect(cache).to receive(:remove)
      cache.add("foo")
      cache.add("bar")
      cache.add("a")
      cache.add(1)
      cache.add(2)
    end
  end

  describe "#count" do
    it "returns the length of the cache" do
      cache.add("foo")
      cache.add("bar")
      expect(cache.count).to eq(2)
    end
  end

  describe "#show" do
    it "returns the cache" do
      cache.add("foo")
      cache.add("bar")
      expect(cache.show).to eq(["foo", "bar"])
    end
  end

  describe "#remove" do
    it "removes the least recently used(first) element" do
      cache.add("foo")
      cache.add("bar")
      cache.add(1)
      cache.add(2)
      cache.remove()
      expect(cache.cache).to eq(["bar", 1, 2])
    end
  end

  describe "#remove_dup" do
    it "calls remove_dup when adding a duplicate element" do
      cache.add("foo")
      cache.add("bar")
      cache.add("foo")
      expect(cache.cache).to eq(["bar", "foo"])
    end
  end
  
end
