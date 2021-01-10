require "minitest/autorun"
require_relative "../../stack/tower_of_hanoi"

class TestTowerOfHanoi < Minitest::Test
  def setup
    @tower_of_hanoi = TowerOfHanoi.new
    @matrix = [[3,2,1],[],[]]
    @matrix_moved = [[],[],[3,2,1]]
  end

  def test_iterative
    assert_equal @tower_of_hanoi.iterative(@matrix), @matrix_moved
    assert_equal @tower_of_hanoi.iterative([[4,3,2,1],[],[]]), [[],[],[4,3,2,1]]
  end
  
end