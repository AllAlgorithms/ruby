class Node
  attr_accessor :value, :left, :right

  def initialize(data)
    @value = data
    @left = nil
    @right = nil
  end
end

class BinaryTree
  attr_accessor :root
  
  def initialize
    @root = nil
  end

## smaller value goes left, bigger value goes right, equal goes right
  def push_node(node, value)
    new_node = Node.new(value)
    if node
      if(value > node.value)
        if(node.right)
          push_node(node.right, value)
        else
          node.right = new_node
        end
      else
        if(node.left)
          push_node(node.left, value)
        else
        node.left = new_node
        end
      end
    else
      @root = new_node
    end
  end

  def traverse_left(node)
    if(node == nil)
      return
    end
    if(node.left)
      traverse_left(node.left)
    end
    p node.value
    if(node.right)
      traverse_left(node.right)
    end
  end

  def traverse_right(node)
    if(node == nil)
      return
    end
    if(node.right)
      traverse_right(node.right)
    end
    p node.value
    if(node.left)
      traverse_right(node.left)
    end
  end

  def traverse_in(node)
    if(node == nil)
      return
    end
    p node.value
    if(node.left)
      traverse_in(node.left)
    end
    if(node.right)
      traverse_in(node.right)
    end
  end

end

arr = [5,6,2,4,1,8,7,9,3];
btree = BinaryTree.new()
arr.each{|e| btree.push_node(btree.root, e) }

puts "In order Traversal"
btree.traverse_in(btree.root)
puts "Left order Traversal"
btree.traverse_left(btree.root)
puts "Right order Traversal"
btree.traverse_right(btree.root)

