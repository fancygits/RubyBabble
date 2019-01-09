class TileBag
  
  @@values = {
    A: 1, B: 2, C: 3, D: 2, E: 1, F: 4, G: 2, H: 4, I: 1, J: 8, K: 5, L: 1, M: 3,
    N: 1, O: 1, P: 3, Q: 10, R: 1, S: 1, T: 1, U: 1, V: 4, W: 4, X: 8, Y: 4, Z: 1
  }
  
  def initialize
    @tiles = []
    fill_bag
  end
  
  def draw_tile
      tile = @tiles.shuffle!.shift
  end
  
  def empty?
      return @tiles.empty?
  end
  
  def self.points_for tile
    return @@values[tile]
  end
  
  
  
  def count
    return @tiles.length
  end
  
  def show_tiles
    return @tiles.sort
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

