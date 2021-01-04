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
end