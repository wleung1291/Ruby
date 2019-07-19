# PHASE 2
def convert_to_int(str)
  begin
    int = Integer(str)
  rescue ArgumentError 
    puts "Cannot convert the string to an int"
  ensure 
    int ||= nil
  end

  int
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]
class NotFruit < StandardError
  def notFruit
    puts "Not a Fruit"
  end
end
class Coffee < StandardError
  def coffee
    puts "Coffee not included"
  end
end

def reaction(maybe_fruit)
  unless FRUITS.include? maybe_fruit
    if maybe_fruit == "coffee"
      raise Coffee
    else
      raise NotFruit
    end
  end 

  puts "OMG, thanks so much for the #{maybe_fruit}!"
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"
  begin
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit) 
  rescue Coffee => e
    puts e.coffee
    retry
  rescue NotFruit => e
    puts e.notFruit
  end
end  



# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime

    raise ArgumentError.new(" 'Years known' less than 5") if @yrs_known < 5
    raise "Name is empty" unless @name.length > 0
    raise "fav_pastime is empty" unless @fav_pastime.length > 0
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


