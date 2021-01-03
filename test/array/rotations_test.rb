require "minitest/autorun"
require_relative "../../array/rotations"

class TestRotations < Minitest::Test
  def setup
    @rotations = Rotations.new
  end

  def test_temp_array
    assert_equal @rotations.temp_array([1,2,3], 2), [3,1,2]
    assert_equal @rotations.temp_array([1,2,3,4,5,6], 5), [6,1,2,3,4,5]
    assert_equal @rotations.temp_array([1,2,3,4,5,6], 3), [4,5,6,1,2,3]
  end

  def test_rotate_once
    assert_equal @rotations.rotate_once([1,2,3]), [2,3,1]
    assert_equal @rotations.rotate_once([1,2,3,4,5,6]), [2,3,4,5,6,1]
  end

  def test_one_by_one
    assert_equal @rotations.one_by_one([1,2,3], 2), [3,1,2]
    assert_equal @rotations.one_by_one([1,2,3,4,5,6], 5), [6,1,2,3,4,5]
  end

  def test_gcd
    assert_equal @rotations.gcd(12, 3), 3
    assert_equal @rotations.gcd(6, 3), 3 
    assert_equal @rotations.gcd(12, 24), 12 
    assert_equal @rotations.gcd(12, 10), 2 
  end

  def test_juggling
    assert_equal @rotations.juggling([1,2,3], 2), [3,1,2]
    assert_equal @rotations.juggling([1,2,3,4,5,6], 5), [6,1,2,3,4,5]
  end

  def test_reverse_array
    assert_equal @rotations.reverse_array([1,2,3], 0, 2), [3,2,1]
    assert_equal @rotations.reverse_array([1,2,3,4,5,6], 0, 2), [3,2,1,4,5,6]
  end

  def test_reversal
    assert_equal @rotations.reversal([1,2,3], 2), [3,1,2]
    assert_equal @rotations.reversal([1,2,3,4,5,6], 5), [6,1,2,3,4,5]
    assert_equal @rotations.reversal([1,2,3,4,5,6], 4), [5,6,1,2,3,4]
  end

  def test_block_swap_recurse
    # number of places to rotate is equal to array.length
    assert_equal @rotations.block_swap_recurse([1,2,3,4,5,6], 0, 6, 6), [1,2,3,4,5,6]
    # number of places to rotate is equal to 0
    assert_equal @rotations.block_swap_recurse([1,2,3,4,5,6], 0, 0, 6), [1,2,3,4,5,6]
    # number of places to rotate is equal to array.length/2
    assert_equal @rotations.block_swap_recurse([1,2,3,4,5,6], 0, 3, 6), [4,5,6,1,2,3]
    # number of places to rotate is less than array.length/2
    assert_equal @rotations.block_swap_recurse([1,2,3,4,5,6], 0, 2, 6), [3,4,5,6,1,2]
    # number of places to rotate is greater than array.length/2
    assert_equal @rotations.block_swap_recurse([1,2,3,4,5,6], 0, 4, 6), [5,6,1,2,3,4]
  end
end