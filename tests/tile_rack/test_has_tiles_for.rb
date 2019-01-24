require 'minitest/autorun'
require_relative '../../tile_rack.rb'

# This class contains unit tests for the TileRack#has_tiles_for? method.
# Author:: James Luke Johnson (mailto:jjohn144@my.westga.edu)
# Version:: 2019.1.22
class TileRack::TestHasTilesFor < MiniTest::Test
  
  # Sets up the tests by creating a new TileRack.
  def setup
    @rack = TileRack.new
  end
  
  # Tests that the TileRack has_tiles_for a word when the tiles are in order without duplicates
  def test_rack_has_needed_letters_when_letters_are_in_order_no_duplicates
    @rack.append(:E)
    @rack.append(:A)
    @rack.append(:S)
    @rack.append(:Y)
    @rack.append(:R)
    @rack.append(:U)
    @rack.append(:N)
    assert_equal true, @rack.has_tiles_for?("easy")
  end
  
  # Tests that a TileRack has_tiles_for a word when the tiles are not in order, without duplicates
  def test_rack_has_needed_letters_when_letters_are_not_in_order_no_duplicates
    @rack.append(:A)
    @rack.append(:L)
    @rack.append(:M)
    @rack.append(:N)
    @rack.append(:O)
    @rack.append(:R)
    @rack.append(:Z)
    assert_equal true, @rack.has_tiles_for?("NORMAL")
  end
  
  # Tests that a TileRack#has_tiles_for returns false when it contains none of the needed tiles.
  def test_rack_doesnt_contain_any_needed_letters
    @rack.append(:M)
    @rack.append(:I)
    @rack.append(:S)
    @rack.append(:T)
    @rack.append(:A)
    @rack.append(:K)
    @rack.append(:E)
    assert_equal false, @rack.has_tiles_for?("Wrong")
  end
  
  # Tests that a TileRack#has_tiles_for returns false when it contains only some of the needed tiles.
  def test_rack_contains_some_but_not_all_needed_letters
    @rack.append(:I)
    @rack.append(:N)
    @rack.append(:E)
    @rack.append(:X)
    @rack.append(:A)
    @rack.append(:C)
    @rack.append(:T)
    assert_equal false, @rack.has_tiles_for?("exactly")
  end

  # Tests that a TileRack has_tiles_for a word with duplicate letters
  def test_rack_contains_a_word_with_duplicate_letters
    @rack.append(:S)
    @rack.append(:E)
    @rack.append(:X)
    @rack.append(:C)
    @rack.append(:E)
    @rack.append(:S)
    @rack.append(:S)
    assert_equal true, @rack.has_tiles_for?("excess")
  end
  
  # Tests that TileRack#has_tiles_for returns false when it doesn't contain enough duplicate tiles.
  def test_rack_doesnt_contain_enough_duplicate_letters
    @rack.append(:N)
    @rack.append(:E)
    @rack.append(:D)
    @rack.append(:E)
    @rack.append(:D)
    @rack.append(:F)
    @rack.append(:L)
    assert_equal false, @rack.has_tiles_for?("Needed")
  end
  
end