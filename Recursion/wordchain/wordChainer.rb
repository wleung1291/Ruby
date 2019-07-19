require 'set'

class WordChainer

    attr_reader :dictionary
    
    def initialize(file)
        @dictionary = Set.new()
        @curr_words = []
        @all_seen_words = {}

        File.readlines(file).each do |word|
            @dictionary << word.chomp
        end
    end

    # Find words of the same length 
    def adj_words(word)
        len = []
        @dictionary.each do |ele|
            if ele.length == word.length 
                len << ele
            end
        end
 
        # find a valid word that differs by one char; the adj word    
        adj = []
        temp = word.dup
        len.each do |ele|
            ele.each_char.with_index do |char, i|
                temp[i] = char
                if temp == ele
                    adj << ele
                    break
                else  
                    temp = word.dup
                end
            end
        end
        return adj
    end

    def run(src, tgt)
        @curr_words << src
        @all_seen_words = {src => nil}
        while !@curr_words.empty?
            explore_curr_words()
            if @all_seen_words.include?(tgt)
                break
            end
        end

        build_path(tgt)
    end

    def explore_curr_words
        new_curr_words = []
        @curr_words.each do |word|
            adj_arr =  adj_words(word)
                adj_arr.each do |adj_word|
                if !@all_seen_words.include?(adj_word)
                    new_curr_words << adj_word
                    @all_seen_words[adj_word] = word
                end
            end
        end
        @curr_words = new_curr_words
        p @curr_words
        
      #new_curr_words.each do |word|
      #    p word
      #    p @all_seen_words[word]
      #end
    end

    def build_path(target)
        path = []
        val = target
        until val == nil
            path << val
            val = @all_seen_words[val]
        end
        p path.reverse
        return path.reverse
    end

end

word = WordChainer.new("dictionary.txt")
#word = WordChainer.new("test.txt")
word.run("duck", "ruby")
#p word.adj_words("rube")
