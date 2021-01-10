require "minitest/autorun"
require_relative "../../queue/two_stacks"

class TestTwoStacks < Minitest::Test
  def setup
    @two_stacks = TwoStacks.new
  end

  def test_expensive_dequeue
    @two_stacks.enqueue(1)
    @two_stacks.enqueue(2)
    @two_stacks.enqueue(3)
    @two_stacks.enqueue(4)
    @two_stacks.enqueue(5)
    assert_equal 1, @two_stacks.dequeue
    assert_equal [], @two_stacks.stack_2
    assert_equal [2,3,4,5], @two_stacks.stack_1
  end
end