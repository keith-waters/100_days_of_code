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
    answer = []

    while !temp.nil?
      answer.push(temp.value)
      queue.push(temp.left)
      queue.push(temp.right)
      temp = queue.shift
    end
    answer
  end

  def depth_first_inorder_recursive(root, arr=[])
    arr = arr
    depth_first_inorder_recursive(root.left, arr) unless root.left.nil?
    arr.push(root.value)
    depth_first_inorder_recursive(root.right, arr) unless root.right.nil?
    arr
  end

  def depth_first_preorder_recursive(root, arr=[])
    arr = arr
    arr.push(root.value)
    depth_first_preorder_recursive(root.left, arr) unless root.left.nil?
    depth_first_preorder_recursive(root.right, arr) unless root.right.nil?
    arr
  end

  def depth_first_postorder_recursive(root, arr=[])
    arr = arr
    depth_first_postorder_recursive(root.left, arr) unless root.left.nil?
    depth_first_postorder_recursive(root.right, arr) unless root.right.nil?
    arr.push(root.value)
    arr
  end

end