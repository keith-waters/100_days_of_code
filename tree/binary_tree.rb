class Node
  attr_accessor :value
  attr_accessor :left
  attr_accessor :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

class BinaryTree
  # printLevelorder(tree)
  # 1) Create an empty queue q
  # 2) temp_node = root /*start from root*/
  # 3) Loop while temp_node is not NULL
  #     a) print temp_node->data.
  #     b) Enqueue temp_node’s children 
  #       (first left then right children) to q
  #     c) Dequeue a node from q.

  def breadth_first_iterative(root)
    queue = []
    temp = root
    ans = []

    while !temp.nil?
      ans.push(temp.value)
      queue.push(temp.left)
      queue.push(temp.right)
      temp = queue.shift
    end
    ans
  end

  def inorder(root, arr=[])
    inorder(root.left, arr) unless root.left.nil?
    arr.push(root.value)
    inorder(root.right, arr) unless root.right.nil?
    arr
  end

  def depth_first_inorder_recursive(root)
    inorder(root, [])
  end

  def depth_first_preorder_recursive(root, arr=[])
    arr.push(root.value)
    depth_first_preorder_recursive(root.left, arr) if !root.left.nil?
    depth_first_preorder_recursive(root.right, arr) if !root.right.nil?
    arr
  end

  def depth_first_postorder_recursive(root, arr=[])
    depth_first_postorder_recursive(root.left, arr) if !root.left.nil?
    depth_first_postorder_recursive(root.right, arr) if !root.right.nil?
    arr.push(root.value)
    arr
  end
end