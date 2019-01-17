require 'minitest/autorun'
require_relative '../../word.rb'

# This class tests the Word#score method.
# Author:: James Luke Johnson (mailto:jjohn144@my.westga.edu)
# Version:: 2019.1.15
class Word::TestScore < MiniTest::Test
  
  # Sets up the tests by creating a new Word.
  def setup
    @word = Word.new
  end

  # Tests that an empty word has a score of zero
  def test_empty_word_should_have_score_of_zero
    assert_equal 0, @word.score
  end
  
  # Tests that the word 'A' has a score of 1. Testing a single tile.
  def test_score_a_one_tile_word
    @word.append(:A)
    assert_equal 1, @word.score
  end
  
  # Tests that the word 'MULTIPLE' has a score of 12. Testing multiple tiles.
  def test_score_a_word_with_multiple_different_tiles
    @word.append(:M)
    @word.append(:U)
    @word.append(:L)
    @word.append(:T)
    @word.append(:I)
    @word.append(:P)
    @word.append(:L)
    @word.append(:E)
    assert_equal 12, @word.score
  end
  
  # Tests that the word 'COMMITTEE' has a score of 15. Testing recurring tiles.
  def test_score_a_word_with_recurring_tiles
    @word.append(:C)
    @word.append(:O)
    @word.append(:M)
    @word.append(:M)
    @word.append(:I)
    @word.append(:T)
    @word.append(:T)
    @word.append(:E)
    @word.append(:E)
    assert_equal 15, @word.score
  end
end
