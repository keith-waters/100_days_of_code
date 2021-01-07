require "minitest/autorun"
require_relative "../../array/sorting"

class TestSorting < Minitest::Test
  def setup
    @sorting = Sorting.new
  end

  def test_simple
    assert_equal @sorting.simple([7,10,4,3,20,15], 3), 7
    assert_equal @sorting.simple([7,10,4,3,20,15], 4), 10
  end

  def test_kth_smallest_min_heap
    assert_equal @sorting.kth_smallest_min_heap([4,3,7,10,20,15], 3), 7
    assert_equal @sorting.kth_smallest_min_heap([7,10,4,3,20,15], 4), 10
    assert_equal @sorting.kth_smallest_min_heap([7,10,4,3,20,15], 6), 20 
  end

  def test_kth_smallest_max_heap
    assert_equal @sorting.kth_smallest_max_heap([4,3,20,7,10,15], 3), 7
    assert_equal @sorting.kth_smallest_max_heap([7,10,4,3,20,15], 4), 10
    assert_equal @sorting.kth_smallest_max_heap([7,10,4,3,20,15], 6), 20 
  end
end