class TileGroup
  
  attr_reader :tiles
  
  def initialize
    @tiles = []
  end
  
  def append(tile)
    raise "Tile has invalid format." unless is_tile_valid?(tile)
    @tiles.push(tile)
  end
  
  
  
  private
  
  def is_tile_valid?(tile)
    tile.is_a?(Symbol) && tile.length == 1 && /[[:upper:]]/.match(tile)
  end
end