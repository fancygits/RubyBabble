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
    puts "-" * 40
    puts "Welcome to the Babble game!"
    puts "Create words from your tile rack until you run out of tiles."
    puts "At any time, you can type :quit to quit the game."
    puts "-" * 40
  end
  
  # The main loop of the game
  def run
  	attempt = ""
  	until (@bag.empty? && @rack.tiles.empty?) || attempt == ":quit"
		  fill_rack
		  puts "Tile Rack: " + @rack.hand
		  print "Your Word: "
		  attempt = gets.strip
		  if attempt == ":quit"
		  	break
		 	end
		  if spelled_correctly?(attempt)
		  	make_word(attempt)
		  else
		    print "Not a valid word.\t\t"
		  end
		  puts "Total score: " + @score.to_s + " points."
		end
		puts "Thanks for playing, total score: " + @score.to_s
  end
  
  private
  
  # Fills the rack with tiles
  def fill_rack
    @rack.number_of_tiles_needed.times do
      unless @bag.empty?
        tile = @bag.draw_tile
        @rack.append(tile)
      end
    end
  end
  
  # Returns true if the word is spelled correctly
  def spelled_correctly?(word)
  	return Spellchecker::check(word)[0][:correct]
  end
  
  # Makes a word and adds it to the wordbank
  def make_word(new_word)
  	begin
			word = @rack.remove_word(new_word)
			@score += word.score
			print "You made " + word.hand.upcase + " for " + word.score.to_s + " points.\t"
		rescue
			print "Not enough tiles.\t\t"
		end
  end
end

Babble.new.run
