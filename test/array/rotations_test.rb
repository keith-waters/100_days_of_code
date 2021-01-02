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
end