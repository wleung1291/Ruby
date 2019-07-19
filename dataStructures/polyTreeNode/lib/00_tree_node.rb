class PolyTreeNode

    attr_reader :parent, :children, :value

    def initialize(value)
        @value = value
        @children = []
        @parent = nil
    end

    # (1) sets the parent property and 
    # (2) adds self node to their parent's array of children 
    #    (unless we're setting parent to nil).
    def parent=(pNode)
        return if self.parent == pNode
        
        # If self has a parent, remove itself from it's current parent
        if self.parent

          self.parent.children.delete(self)
        end

        # Set pNode to be the parent node
        @parent = pNode

        # Add self to @parent's array of children, unless we want self to have no parent
        self.parent.children << self unless self.parent.nil?

        return self        
    end

    # should pass itself to the child's #parent= 
    # doesn't add the child twice
    def add_child(cNode)
        cNode.parent=self
    end

    # should pass nil to the child's #parent=
    def remove_child(cNode)
        raise "#{cNode.value} is not a child" if !self.children.include?(cNode)
        cNode.parent = nil
    end

    # BFS visits each level first. Starting with the root node, then their 
    # children nodes, then their children's children, etc
    def bfs(tgt_val)
        queue = []
        queue << self

        until queue.empty?
            tgt_node = queue.shift
            if tgt_node.value == tgt_val
                return tgt_node
            end
            tgt_node.children.each do |child|
                queue << child
            end
        end
    end

		# DFS - Preorder visits node, the left most child, and then the right child.
    def dfs(tgt_val)
        tgt_node = self

				if tgt_node.value == tgt_val
            return tgt_node 
        end

				tgt_node.children.each do |ele|
						result = ele.dfs(tgt_val)
            return result if result
				end
				
        return nil
		end	
	
    n1 = PolyTreeNode.new("root1")                    #        n2
    n2 = PolyTreeNode.new("root2")                    #        /\
    n3 = PolyTreeNode.new("root3")                    #      n3  n1
    n4 = PolyTreeNode.new("root4")                    #      /   /
    n5 = PolyTreeNode.new("root5")                    #    n5   n4
    
    n3.parent = n1 # connect n3 to n1, set n1 to be n3's parent
    n3.parent = n2 # connect n3 to n2, set n2 to be n3's parent
    n1.parent = n2
    n1.add_child(n4) # add n4 as a child to n1
    n3.add_child(n5)

    #p n2.bfs("root4") # Visits in order n2, n3, n1, n5, n4
		n2.dfs("root4") # Visits in order n2, n3, n5, n1, n4

    #raise "Bad parent=!" unless n3.parent == n2
    #raise "Bad parent=!" unless n2.children == [n3, n1]
    #raise "Bad parent=!" unless n1.children == []
 
end