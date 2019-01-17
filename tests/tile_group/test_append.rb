require 'minitest/autorun'
require_relative '../../tile_group.rb'

# This class tests the append method of TileGroup.
# Author:: James Luke Johnson (mailto:jjohn144@my.westga.edu)
# Version:: 2019.1.15
class TileGroup::TestAppend < MiniTest::Test

  # Creates a new, empty TileGroup for testing.
  def setup
    @group = TileGroup.new
  end

  # Tests that a TileGroup can append one tile.
  def test_append_one_tile
    @group.append(:A)
    assert_equal([:A], @group.tiles)
  end
  
  # Tests that a TileGroup can append many tiles.
  def test_append_many_tiles
    @group.append(:A)
    @group.append(:B)
    @group.append(:C)
    assert_equal([:A, :B, :C], @group.tiles)
  end
  
  # Tests that TileGroup can append duplicate tiles.
  def test_append_duplicate_tiles
    @group.append(:A)
    @group.append(:A)
    @group.append(:A)
    @group.append(:A)
    assert_equal([:A, :A, :A, :A], @group.tiles)
  end
end