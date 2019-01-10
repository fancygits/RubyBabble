require 'minitest/autorun'
require_relative '../../tile_bag.rb'

class TestDrawTile < MiniTest::Test
  def test_has_proper_number_of_tiles
    count = 0
    bag = TileBag.new
    98.times do
      bag.draw_tile
      count += 1
    end
    assert(true, bag.empty?)
  end
  def test_has_proper_tile_distribution
  
  end  
end
