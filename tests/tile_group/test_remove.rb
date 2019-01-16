require 'minitest/autorun'
require_relative '../../tile_group.rb'

# This class tests the remove method of TileGroup.
# Author:: James Luke Johnson (mailto:jjohn144@my.westga.edu)
# Version:: 2019.1.15
class TestRemove < MiniTest::Test

  def setup
    @group = TileGroup.new
    @group.append(:A)
    @group.append(:A)
    @group.append(:B)
    @group.append(:B)
    @group.append(:B)
    @group.append(:C)
    @group.append(:C)
    @group.append(:D)
    @group.append(:D)
  end

  # Tests that a TileGroup can its only tile.
  def test_remove_only_tile
    single = TileGroup.new
    single.append(:O)
    single.remove(:O)
    assert true single.tiles.empty?
  end
  
  # Tests that a TileGroup can remove the first of many tiles.
  def test_remove_first_tile_from_many
    
  end
  
  # Tests that TileGroup can remove the last of many tiles.
  def test_remove_last_tile_from_many
    
  end
  
  # Tests that TileGroup can remove a middle of many tiles.
  def test_remove_middle_tile_from_many
    
  end
  
  # Tests that TileGroup can remove many tiles.
  def test_remove_multiple_tiles
    
  end
  
  # Tests that TileGroup does not remove duplicate tiles.
  def test_make_sure_duplicates_are_not_removed
    
  end
end