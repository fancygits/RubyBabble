require_relative 'tile_bag.rb'
require_relative 'tile_rack.rb'
require_relative 'word.rb'
require 'spellchecker'
require 'tempfile'

# This class represents controller for the Babble application.
# Author:: James Luke Johnson (mailto:jjohn144@my.westga.edu)
# Version:: 2019.1.29
class Babble
  
  # Sets up the Babble game
  def initialize 
    @bag = TileBag.new
    @rack = TileRack.new
    @score = 0
    @wordbank = []
    intro
  end
  
  # The main loop of the game
  def run
    fill_rack
    puts "Tile Rack: " + @rack.hand
    print "Your Word: "
    attempt = gets.chomp
    #if Spellchecker::check(attempt)[0][:correct]
      word = @rack.remove_word(attempt)
      @score += word.score
      @wordbank.push(word)
      puts "You made " + attempt + " for " + word.score.to_s + " points"
   # else
   #   puts "Not a valid word"
   # end
  end
  
  private
  
  # Displays the introduction message
  def intro
    puts "-" * 40
    puts "Welcome to the Babble game!"
    puts "Create words from your tile rack until you run out of tiles."
    puts "At any time, you can type :quit to quit the game."
    puts "-" * 40
  end
  
  def fill_rack
    @rack.number_of_tiles_needed.times do
      unless @bag.empty?
        tile = @bag.draw_tile
        @rack.append(tile)
      else
        game_over
      end
    end
  end
  
  def game_over
    puts "Game Over"
  end
  
end

Babble.new.run
