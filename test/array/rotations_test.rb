require "minitest/autorun"
require_relative "../../array/rotations"

class TestRotations < Minitest::Test
  def setup
    @rotations = Rotations.new
  end

  def test_temp_array
    assert_equal @rotations.temp_array([1,2,3], 2), [3,1,2]
    assert_equal @rotations.temp_array([1,2,3,4,5,6], 5), [6,1,2,3,4,5]
  end

  def test_left_rotate
    assert_equal @rotations.left_rotate([1,2,3], 2), [3,1,2]
    assert_equal @rotations.left_rotate([1,2,3,4,5,6], 5), [6,1,2,3,4,5]
  end

  def test_juggling
    assert_equal @rotations.juggling([1,2,3], 2), [3,1,2]
    assert_equal @rotations.juggling([1,2,3,4,5,6], 5), [6,1,2,3,4,5]
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