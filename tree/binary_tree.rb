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
  def initialize
  end

# # Function to  print level order traversal of tree
# def printLevelOrder(root):
#   h = height(root)
#   for i in range(1, h+1):
#       printGivenLevel(root, i)


# # Print nodes at a given level
# def printGivenLevel(root , level):
#   if root is None:
#       return
#   if level == 1:
#       print(root.data,end=" ")
#   elif level > 1 :
#       printGivenLevel(root.left , level-1)
#       printGivenLevel(root.right , level-1)

end