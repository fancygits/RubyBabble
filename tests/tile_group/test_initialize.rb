require 'minitest/autorun'
require_relative '../../tile_group.rb'

# This class tests the constructor of TileGroup.
# Author:: James Luke Johnson (mailto:jjohn144@my.westga.edu)
# Version:: 2019.1.15
class TestInitialize < MiniTest::Test

  # Tests that a new TileGroup has an empty tiles array.
  def test_create_empty_tile_group
    group = TileGroup.new
    assert group.tiles.empty?
  end
end