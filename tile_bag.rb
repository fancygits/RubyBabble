# This class represents a bag of _Scrabble_ tiles to draw from.
# Author:: James Luke Johnson (mailto:jjohn144@my.westga.edu)
# Version:: 2019.1.10
class TileBag
  
  # The values of each *Tile*
  VALUES = {
    A: 1, B: 3, C: 3, D: 2, E: 1, F: 4, G: 2, H: 4, I: 1, J: 8, K: 5, L: 1, M: 3,
    N: 1, O: 1, P: 3, Q: 10, R: 1, S: 1, T: 1, U: 1, V: 4, W: 4, X: 8, Y: 4, Z: 10
  }
  
  # Creates a new TileBag and fills it with the standard distribution
  # of _Scrabble_ tiles.
  def initialize
    @tiles = []
    fill_bag
  end
  
  # Draws a random tile from the TileBag.
  # [Returns:] 
  # [Tile] _or_ 
  # [nil] if TileBag is empty.
  def draw_tile
    @tiles.shuffle!.shift
  end
  
  # Checks if the TileBag is empty.
  # [+Returns:+]
  # [true] if bag is empty.
  def empty?
    return @tiles.empty?
  end
  
  # Checks the value of a *Tile*.
  # [+Parameters:+]
  # [tile] A symbol representing the tile to get points for.
  # [+Returns:+]
  # [int] The value of the tile _or_ 
  # [nil] if TileBag is empty.
  def self.points_for tile
    return VALUES[tile]
  end
  
  private
  
  def fill_bag
    @tiles.push(:K, :J, :X, :Q, :Z)
    2.times { @tiles.push(:B, :C, :M, :P, :F, :H, :V, :W, :Y) }
    3.times { @tiles.push(:G) }
    4.times { @tiles.push(:L, :S, :U, :D) }
    6.times { @tiles.push(:N, :R, :T) }
    8.times { @tiles.push(:O) }
    9.times { @tiles.push(:A, :I) }
    12.times { @tiles.push(:E) }
  end
end
