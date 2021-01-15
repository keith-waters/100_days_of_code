require "minitest/autorun"
require_relative "../../linked_list/traversal"

class TestLinkedList < Minitest::Test
  def setup
    @linked_list = LinkedList.new([1,2,3,4,5,6])
  end

  def test_traverse
    assert_equal [1,2,3,4,5,6], @linked_list.traverse
  end

  def test_unshift
    @linked_list.unshift(10)
    assert_equal [10,1,2,3,4,5,6], @linked_list.traverse
  end

  def test_insert
    @linked_list.insert(10, 3)
    assert_equal [1,2,3,10,4,5,6], @linked_list.traverse
  end

  def test_push
    @linked_list.push(10)
    assert_equal [1,2,3,4,5,6,10], @linked_list.traverse
  end

  def test_remove
    @linked_list.remove(3)
    assert_equal [1,2,4,5,6], @linked_list.traverse
  end

  # position is 0 indexed
  def test_remove_at_position_2
    @linked_list.remove_at_position(2)
    assert_equal [1,2,4,5,6], @linked_list.traverse
  end

  def test_remove_at_position_0
    @linked_list.remove_at_position(0)
    assert_equal [2,3,4,5,6], @linked_list.traverse
  end

  def test_length_iterative
    assert_equal 6, @linked_list.length_iterative
  end

  def test_length_recursive
    assert_equal 6, @linked_list.length_recursive
  end
end