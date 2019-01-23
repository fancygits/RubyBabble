require 'minitest/autorun'
require_relative '../../tile_rack.rb'

# This class contains unit tests for the TileRack#number_of_tiles_needed method.
# Author:: James Luke Johnson (mailto:jjohn144@my.westga.edu)
# Version:: 2019.1.22
class TileRack::TestNumberOfTilesNeeded < MiniTest::Test
  
  # Sets up the tests by creating a new TileRack.
  def setup
    @rack = TileRack.new
  end
  
  # Tests that an empty TileRack needs 7 tiles
  def test_empty_tile_rack_should_need_max_tiles
    assert_equal [], @rack.tiles
    assert_equal 7, @rack.number_of_tiles_needed
  end
  
  # Tests that a TileRack with one tile needs 6 tiles
  def test_tile_rack_with_one_tile_should_need_max_minus_one_tiles
    @rack.append(:A)
    assert_equal [:A], @rack.tiles
    assert_equal 6, @rack.number_of_tiles_needed
  end
  
  # Tests that a TileRack with 4 tiles needs 3 tiles
  def test_tile_rack_with_several_tiles_should_need_some_tiles
    @rack.append(:T)
    @rack.append(:E)
    @rack.append(:S)
    @rack.append(:T)
    assert_equal 4, @rack.tiles.length
    assert_equal 3, @rack.number_of_tiles_needed
  end
  
  # Tests that a full TileRack (with 7 tiles) needs 0 tiles
  def test_that_full_tile_rack_doesnt_need_any_tiles
    @rack.append(:I)
    @rack.append(:T)
    @rack.append(:S)
    @rack.append(:F)
    @rack.append(:U)
    @rack.append(:L)
    @rack.append(:L)
    assert_equal 7, @rack.tiles.length
    assert_equal 0, @rack.number_of_tiles_needed
  end
  
end