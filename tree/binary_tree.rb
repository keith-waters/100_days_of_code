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

  def depth_first_iterative_inorder(root)
    # 1) Create an empty stack S.
    # 2) Initialize current node as root
    # 3) Push the current node to S and set current = current->left until current is NULL
    # 4) If current is NULL and stack is not empty then 
    #     a) Pop the top item from stack.
    #     b) Print the popped item, set current = popped_item->right 
    #     c) Go to step 3.
    # 5) If current is NULL and stack is empty then we are done.
    
    temp = root
    stack = []
    ans = []
    
    while true
      if !temp.nil?
        stack.push(temp)
        # preorder
        # ans.push(temp.value)
        temp = temp.left
        next
      end

      if temp.nil? && stack.length > 0
        popped = stack.pop
        # inorder
        ans.push(popped.value)
        temp = popped.right
      end

      break if temp.nil? && stack.length == 0 
    end
    
    stack.each { |i| p i.value }
    ans
  end

  def depth_first_iterative_postorder(root)
    # 1.1 Create an empty stack
    # 2.1 Do following while root is not NULL
    #     a) Push root's right child and then root to stack.
    #     b) Set root as root's left child.
    # 2.2 Pop an item from stack and set it as root.
    #     a) If the popped item has a right child and the right child 
    #       is at top of stack, then remove the right child from stack,
    #       push the root back and set root as root's right child.
    #     b) Else print root's data and set root as NULL.
    # 2.3 Repeat steps 2.1 and 2.2 while stack is not empty.

    stack = []
    temp = root
    ans = []

    while true
      if !temp.nil?
        stack.push(temp.right) unless temp.right.nil?
        stack.push(temp)
        temp = temp.left
        next
      end

      temp = stack.pop
      if temp.right && temp.right == stack[stack.length-1]
        popped = stack.pop
        stack.push(temp)
        temp = popped
      else
        ans.push(temp.value)
        temp = nil
      end
      
      break if stack.empty?
    end
    ans
  end
end