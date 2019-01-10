require 'minitest/autorun'
require_relative '../../tile_bag.rb'

class TestPointsFor < MiniTest::Test
  def test_confirm_point_values
    [:L, :S, :U, :N, :R, :T, :O, :A, :I, :E].each do |tile| 
      assert_equal(1, TileBag::points_for(tile))
    end
    [:G, :D].each { |tile| assert_equal(2, TileBag::points_for(tile)) }
    [:B, :C, :M, :P].each { |tile| assert_equal(3, TileBag::points_for(tile)) }
    [:F, :H, :V, :W, :Y].each { |tile| assert_equal(4, TileBag::points_for(tile)) }
    assert_equal(5, TileBag::points_for(:K))
    [:J, :X].each { |tile| assert_equal(8, TileBag::points_for(tile)) }
    [:Q, :Z].each { |tile| assert_equal(10, TileBag::points_for(tile)) }
  end
end
