class Node 
  attr_reader :value
  attr_accessor :left,:right

  def initialize(value = nil)
    @value = value
    left = nil;
    right = nil;
  end
end

class BinarySearchTree
  attr_accessor :root_node
  def initialize(root_value = nil)
    @root_node = Node.new(root_value) 
  end

  def insert(node,value)
    if node.value == value
      return node
    elsif value < node.value
      insert(node.left,value)
    elsif value > node.value
      insert(node.right,value)
    else
      return node = Node.new(value)
    end
  end

  def BST_is_valid?(node,min=-1.0/0.0,max=1.0/0.0)
    until node.left.nil? && node.right.nil?  
      if min > node.value || max < node.value
        return false
      else 
        BST_is_valid?(node.left,min,node.value)
        BST_is_valid?(node.right,node.value,max)
      end        
    end   
  end

  def search(value,node)
    return nil if node.nil?
    
    if value == node.value
      return node
    elsif value < node.value
      return search(value,node.left)
    elsif value >node.value
      return search(value,node.right) 
    end         
  end

  def delete(value)
    node = search(value,node)
    if !node.nil?
      remove(node)
    end
  end
  
  def remove
    if node.left.nil? && node.right.nil?
    elsif !node.left.nil? && node.right.nil?
      remove(node.left)
    elsif !node.left.nil? && node.right.nil?
      remove(node.right)
    else 
      delete_node_with_two_children(node)    
    end
  end

  def delete_node_with_two_children(node)
    min_node = find_min_node(node.right)
    replace_value(min_node,node)
    remove_min_node(min_node)
  end

  def find_min_node(node)
    if node.left.nil?
      min_node = node
      return min_node
    else
      find_min_node(node.left) 
    end 
  end

  def replace_value(min_node,node)
    node.value = min_node.value
  end

  def remove_min_node(min_node)
    min_node = nil
  end
end

# delete the node it self if there is not child node 
# there is no left child, then replace the deleted node with the right child
# there is no right child, then replace the deleted node with the left child
# there is both a left and right child (this is the interesting case)
# if both child is there find the minimum value of right subtree (the left most child of right child)

# bst = BinarySearchTree.new()
# insert = bst.insert(Node(5))
# puts "Ajit" 

bst = BinarySearchTree.new(5)
#bst.insert(bst.root_node,10)





#https://www.udemy.com/zoho-crm-system-administrator-masterclass/learn/v4/t/lecture/12757925?start=0
#http://codingjunkie.net/binary-search-tree-programming-praxis-solution/
#
#https://github.com/kumar91gopi/Algorithms-and-Data-Structures-in-Ruby
