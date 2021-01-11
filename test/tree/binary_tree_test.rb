require "minitest/autorun"
require_relative "../../tree/binary_tree"

class TestBinaryTree < Minitest::Test
  def setup
    @tree = BinaryTree.new
    @root = Node.new(1)
    @root.left = Node.new(2)
    @root.right = Node.new(3)
    @root.left.left = Node.new(4)
    @root.left.right = Node.new(5)
  end

  def test_breadth_first_iterative
    assert_equal [1,2,3,4,5], @tree.breadth_first_iterative(@root)
  end

  def test_depth_first_inorder_recursive
    #     1
    #   2   3
    # 4   5
    assert_equal [4,2,5,1,3], @tree.depth_first_inorder_recursive(@root)
  end

  def test_depth_first_preorder_recursive
    assert_equal [1,2,4,5,3], @tree.depth_first_preorder_recursive(@root)
  end

  def test_depth_first_postorder_recursive
    assert_equal [4,5,2,3,1], @tree.depth_first_postorder_recursive(@root)
  end
end