require_relative 'tile_group.rb'

# This class represents the current set of 7 tiles from which the player can make a word.
# Author:: James Luke Johnson (mailto:jjohn144@my.westga.edu)
# Version:: 2019.1.22
class TileRack < TileGroup

  # The maximum number of tiles in a TileRack
  MAX_TILES = 7
  
  def number_of_tiles_needed
    return MAX_TILES - @tiles.length
  end
  
end
