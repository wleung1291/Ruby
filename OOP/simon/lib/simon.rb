require "colorize"

class Simon
  COLORS = %w(r b g y)

  attr_reader :sequence_length, :game_over, :seq
  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @seq = []
    @game_over = false
  end

  def play
    until game_over
      take_turn()
    end
    
    game_over_message()
    reset_game()
  end

  def take_turn
    show_sequence()
    require_sequence()

    if game_over == false
      puts
      puts "Streak: #{sequence_length}"
      round_success_message()
      self.sequence_length += 1

    end
  end

  def show_sequence
    add_random_color()

    seq.each do |color|
      system "clear" 

      case color 
      when "r"
        red()
      when "y"
        yellow()
      when "g"
        green()
      else
        blue()
      end

      sleep(1)
      system "clear"
    end

  end

  # prompt the user to repeat back the new sequence that was just shown to 
  # them, one color at a time. The game is over if the guess is incorrect.
  def require_sequence
    puts "Repeat Sequence (Only repeat the first letter of each color):"
    seq.length.times do |i|
      print "> "
      input = gets.chomp
      
      if input != seq[i]
        self.game_over = true
        break
      end  
    end
  end

  # Adds a random color to the sequence
  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    puts "Round Success!"
    sleep(1)
  end

  def game_over_message
    puts "Game Over!"
  end

  def reset_game
    self.sequence_length = 1
    self.game_over = false
    self.seq = []
  end

  # Methods below to print the colors formatted
  def yellow
    puts "   yellow".yellow
    puts
    print "red"
    puts "      blue"
    puts
    puts  "   green"
    puts
  end

  def red
    puts "   yellow"
    puts
    print "red".red
    puts "      blue"
    puts
    puts  "   green"
    puts
  end
  
  def blue
    puts "   yellow"
    puts
    print "red"
    puts "      blue".blue
    puts
    puts  "   green"
    puts
  end

  def green
    puts "   yellow"
    puts
    print "red"
    puts "      blue"
    puts
    puts  "   green".green
    puts
  end
  
end

simon = Simon.new()
simon.play