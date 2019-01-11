require 'minitest/autorun'
require_relative '../../tile_bag.rb'

class TestDrawTile < MiniTest::Test
  def test_has_proper_number_of_tiles
    bag = TileBag.new
    97.times do
      bag.draw_tile
      refute bag.empty?
    end
    assert true, bag.draw_tile
    assert true, bag.empty?
    assert_nil bag.draw_tile
  end
  
  def test_has_proper_tile_distribution
    bag = TileBag.new
    sd = [
      :A, :A, :A, :A, :A, :A, :A, :A, :A,
      :B, :B,
      :C, :C,
      :D, :D, :D, :D,
      :E, :E, :E, :E, :E, :E, :E, :E, :E, :E, :E, :E,
      :F, :F,
      :G, :G, :G,
      :H, :H,
      :I, :I, :I, :I, :I, :I, :I, :I, :I,
      :J,
      :K,
      :L, :L, :L, :L,
      :M, :M,
      :N, :N, :N, :N, :N, :N,
      :O, :O, :O, :O, :O, :O, :O, :O,
      :P, :P,
      :Q,
      :R, :R, :R, :R, :R, :R,
      :S, :S, :S, :S,
      :T, :T, :T, :T, :T, :T,
      :U, :U, :U, :U,
      :V, :V,
      :W, :W,
      :X,
      :Y, :Y,
      :Z
    ]
    98.times do
      tile = bag.draw_tile
      assert_equal(tile, sd.delete_at(sd.index(tile)))
    end
    assert true, sd.empty?
    assert_nil bag.draw_tile
  end  
end
