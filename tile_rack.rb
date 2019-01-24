require_relative 'tile_group.rb'
require_relative 'word.rb'

# This class represents the current set of 7 tiles from which the player can make a word.
# Author:: James Luke Johnson (mailto:jjohn144@my.westga.edu)
# Version:: 2019.1.22
class TileRack < TileGroup

  # The maximum number of tiles in a TileRack
  MAX_TILES = 7
  
  # Returns the number of tiles needed to refill the TileRack to MAX_TILES
  def number_of_tiles_needed
    return MAX_TILES - @tiles.length
  end
  
  # Returns true if the rack has enough tiles to make the word represented by the text parameter.
  def has_tiles_for?(text)
    raise "That is not a valid String." unless text.is_a?(String)
    copy = duplicate_tiles
    text.upcase.each_char do |c| 
      i = copy.index(c.to_sym)
      return false if i.nil? 
      copy.delete_at(i)
    end
    return true
  end
  
  # Returns a Word object made by removing the tiles given by text (a string).
  def remove_word(text)
    raise "Not enough tiles to make that Word." unless has_tiles_for?(text)
    word = Word.new
    text.upcase.each_char do |c|
      word.append(c.to_sym)
      remove(c.to_sym)
    end
    return word
  end
  
  private
  
  # Returns a duplicate of the tiles array
  def duplicate_tiles
    copy = []
    @tiles.each { |tile| copy.push(tile) }
    return copy
  end
end
