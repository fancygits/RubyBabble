require 'minitest/autorun'
require_relative '../../tile_group.rb'

# This class tests the hand method of TileGroup.
# Author:: James Luke Johnson (mailto:jjohn144@my.westga.edu)
# Version:: 2019.1.15
class TileGroup::TestHand < MiniTest::Test

  def setup # :nodoc:
    @group = TileGroup.new
  end
  
  # Tests that an empty TileGroup will convert to an empty string
  def test_convert_empty_group_to_string
    assert_equal '', @group.hand
  end
  
  # Tests that a TileGroup with one tile will convert to a string
  def test_convert_single_tile_group_to_string
    @group.append(:A)
    assert_equal 'A', @group.hand
  end
  
  # Tests that a TileGroup with many tiles will convert to a string
  def test_convert_multi_tile_group_to_string
    @group.append(:V)
    @group.append(:I)
    @group.append(:C)
    @group.append(:T)
    @group.append(:O)
    @group.append(:R)
    @group.append(:Y)
    assert_equal 'VICTORY', @group.hand
  end
  
  # Tests that a TileGroup with duplicate tiles will convert to a string
  def test_convert_multi_tile_group_with_duplicates_to_string
    @group.append(:M)
    @group.append(:I)
    @group.append(:S)
    @group.append(:S)
    @group.append(:I)
    @group.append(:S)
    @group.append(:S)
    @group.append(:I)
    @group.append(:P)
    @group.append(:P)
    @group.append(:I)
    assert_equal 'MISSISSIPPI', @group.hand
  end
end