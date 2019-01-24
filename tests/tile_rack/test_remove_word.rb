require 'minitest/autorun'
require_relative '../../tile_rack.rb'

# This class contains unit tests for the TileRack#remove_word method.
# Author:: James Luke Johnson (mailto:jjohn144@my.westga.edu)
# Version:: 2019.1.23
class TileRack::TestRemoveWord < MiniTest::Test
  
  # Sets up the tests by creating a new TileRack.
  def setup
    @rack = TileRack.new
  end
  
  # Tests that TileRack#remove_word returns a word with the same tiles
  def test_can_remove_a_word_whose_letters_are_in_order_on_the_rack
    @rack.append(:N)
    @rack.append(:E)
    @rack.append(:W)
    @rack.append(:O)
    @rack.append(:R)
    @rack.append(:D)
    @rack.append(:S)
    new_word = @rack.remove_word("word")
    assert_kind_of Word, new_word
    assert_equal "WORD", new_word.hand
    assert_equal "NES", @rack.hand
  end
  
  # Tests that TileRack#remove_word returns a word when the tiles are out of order
  def test_can_remove_a_word_whose_letters_are_not_in_order_on_the_rack
    @rack.append(:E)
    @rack.append(:K)
    @rack.append(:M)
    @rack.append(:N)
    @rack.append(:P)
    @rack.append(:T)
    @rack.append(:U)
    new_word = @rack.remove_word("UNKEMPT")
    assert_equal "UNKEMPT", new_word.hand
    assert_equal true, @rack.tiles.empty?
  end
  
  # Tests that TileRack#remove_word returns a word with duplicate letters
  def test_can_remove_word_with_duplicate_letters
    @rack.append(:B)
    @rack.append(:A)
    @rack.append(:L)
    @rack.append(:L)
    @rack.append(:O)
    @rack.append(:O)
    @rack.append(:N)
    new_word = @rack.remove_word("Balloon")
    assert_equal "BALLOON", new_word.hand
    assert_equal true, @rack.tiles.empty?
  end
  
  # Tests that TileRack#remove_word will create a word withouth removing extra duplicate tiles
  def test_can_remove_word_without_removing_unneeded_duplicate_letters
    @rack.append(:E)
    @rack.append(:E)
    @rack.append(:B)
    @rack.append(:E)
    @rack.append(:E)
    @rack.append(:E)
    @rack.append(:E)
    new_word = @rack.remove_word("bee")
    assert_kind_of Word, new_word
    assert_equal "BEE", new_word.hand
    assert_equal "EEEE", @rack.hand
  end
end
