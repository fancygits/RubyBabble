require_relative 'tile_group.rb'
require_relative 'tile_bag.rb'

# This class represents a scorable set of tiles drawn in a TileGroup.
# Author:: James Luke Johnson (mailto:jjohn144@my.westga.edu)
# Version:: 2019.1.15
class Word < TileGroup
  
  # Scores the Word by getting the value of each tile.
  def score
    score = 0
    @tiles.each { |tile| score += TileBag::points_for(tile) }
    return score
  end  
end
