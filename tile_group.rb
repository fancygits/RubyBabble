# This class represents a group of _Scrabble_ tiles drawn from a TileBag.
# Author:: James Luke Johnson (mailto:jjohn144@my.westga.edu)
# Version:: 2019.1.15
class TileGroup
  
  attr_reader :tiles
  
  # Creates an empty TileGroup
  def initialize 
    @tiles = []
  end
  
  # Appends a new *Tile* to the TileGroup
  def append(tile)
    raise "Tile has invalid format." unless is_tile_valid?(tile)
    @tiles.push(tile)
  end
  
  # Removes a *Tile* from the TileGroup
  def remove(tile)
    raise "Tile not found." if (@tiles.index(tile) == nil)
    @tiles.delete_at(@tiles.index(tile))
  end
  
  # Returns a string that is the concatenation of all Tiles' string values
  def hand
    hand = ''
    @tiles.each { |tile| hand += tile.to_s }
    return hand
  end
  
  private
  
  # Checks that a *Tile* is a Symbol and exactly 1 uppercase character.
  def is_tile_valid?(tile)
    tile.is_a?(Symbol) && tile.length == 1 && /[[:upper:]]/.match(tile)
  end
end