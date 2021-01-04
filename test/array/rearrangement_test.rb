require "minitest/autorun"
require_relative "../../array/rearrangement"

class TestRearrangement < Minitest::Test
  def setup
    @rearrangement = Rearrangement.new
    @arr_1 = [-1, -1, 6, 1, 9, 3, 2, -1, 4, -1]
    @sorted_arr_1 = [-1, 1, 2, 3, 4, -1, 6, -1, -1, 9]
    @arr_2 = [19, 7, 0, 3, 18, 15, 12, 6, 1, 8,11, 10, 9, 5, 13, 16, 2, 14, 17, 4]
    @sorted_arr_2 = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]
  end

  def test_naive
    assert_equal @rearrangement.naive(@arr_1), @sorted_arr_1
    assert_equal @rearrangement.naive(@arr_2), @sorted_arr_2
  end

  def test_check_and_replace
    assert_equal @rearrangement.check_and_replace(@arr_1), @sorted_arr_1
    assert_equal @rearrangement.check_and_replace(@arr_2), @sorted_arr_2
  end

  def test_hash_set
    assert_equal @rearrangement.hash_set(@arr_1), @sorted_arr_1
    assert_equal @rearrangement.hash_set(@arr_2), @sorted_arr_2
  end

  def test_swap_elements
    assert_equal @rearrangement.swap_elements(@arr_1), @sorted_arr_1
    assert_equal @rearrangement.swap_elements(@arr_2), @sorted_arr_2
  end

  def test_reverse_iterative
    assert_equal @rearrangement.reverse_iterative([1,2,3,4,5,6]), [6,5,4,3,2,1]
    assert_equal @rearrangement.reverse_iterative([12,13,14,15]), [15,14,13,12]
    assert_equal @rearrangement.reverse_iterative('zigzagoon'), 'noogazgiz'
  end

  def test_reverse_recursive
    assert_equal @rearrangement.reverse_recursive([1,2,3,4,5,6]), [6,5,4,3,2,1]
    assert_equal @rearrangement.reverse_recursive([12,13,14,15]), [15,14,13,12]
    assert_equal @rearrangement.reverse_recursive('zigzagoon'), 'noogazgiz'
  end
end