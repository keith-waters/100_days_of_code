require "minitest/autorun"
require_relative "../../linked_list/traversal"

class TestTraversal < Minitest::Test
  def setup
    @head = Node.new(1)
    @head.next = Node.new(2)
    @head.next.next = Node.new(3)
    @head.next.next.next = Node.new(4)
    @head.next.next.next.next = Node.new(5)
    @traversal = Traversal.new
  end

  def test_traverse
    assert_equal [1,2,3,4,5], @traversal.traverse(@head)
  end

  def test_unshift
    head = @traversal.unshift(10, @head)
    assert_equal [10,1,2,3,4,5], @traversal.traverse(head)
  end

  def test_insert
    head = @traversal.insert(10, @head, 3)
    assert_equal [1,2,3,10,4,5], @traversal.traverse(head)
  end

  def test_push
    head = @traversal.push(10, @head)
    assert_equal [1,2,3,4,5,10], @traversal.traverse(head)
  end

  def test_remove
    head = @traversal.remove(3, @head)
    assert_equal [1,2,4,5], @traversal.traverse(head)
  end

  def test_remove_at_position_3
    head = @traversal.remove_at_position(3, @head)
    assert_equal [1,2,4,5], @traversal.traverse(head)
  end

  def test_remove_at_position_1
    head = @traversal.remove_at_position(1, @head)
    assert_equal [2,3,4,5], @traversal.traverse(head)
  end

  def test_length_iterative
    assert_equal 5, @traversal.length_iterative(@head)
  end

  def test_length_recursive
    assert_equal 5, @traversal.length_recursive(@head)
  end
end