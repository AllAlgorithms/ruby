# A binary search tree (BST) is a node based binary tree data structure
# Keys of the left subtree of a node should be less than the node key.
# Keys of the right subtree of a node should be greater than the node key.
# Both the left and right subtrees must also be binary search trees.
#
class Node
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

def bst?(node, lower_limit = nil, upper_limit = nil)
  return true if node.nil?
  return false if !upper_limit.nil? && upper_limit < node.value
  return false if !lower_limit.nil? && lower_limit > node.value

  is_left_bst = is_bst(node.left, lower_limit, node.value)
  is_right_bst = is_bst(node.right, node.value, upper_limit)

  is_left_bst && is_right_bst
end

root = Node.new(4)
root.left = Node.new(3)
root.right = Node.new(5)
root.left.left = Node.new(1)
root.left.right = Node.new(2)

p is_bst(root)
