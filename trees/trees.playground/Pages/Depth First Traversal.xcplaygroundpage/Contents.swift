//: [Previous](@previous)

import Foundation

/*
 Dept First Traversal (DFT)
 --------------------
 • Node traversal order:
 - Start at the root node
    - Go to the child on the left
    - Go to the child on the right
 - When the leaf node is reached go back to the root and start again
 
 Steps
 -----
 1.  Declare the Tree class
 2.  Declare the add method to add nodes
 3.  Create an extension on the TreeNode structure and declare the method that traverses the tree from the top most node to the leaf node.
 */

//  ******** TREE DATA STRUCTURE ********
class TreeNode<T> {
    var value : T
    var children : [TreeNode] = []
    
    init(_ value : T) {
        self.value = value
    }
    
    func add(_ child : TreeNode) {
        self.children.append(child)
    }
}


/*
 The best approach to traversal is to use recursion
 The reason, because the node *and* the subnodes must be visited.
 */
extension TreeNode {
    func forEachDepthFirst(_ visit : (TreeNode) -> Void) {
        visit(self)
        children.forEach {
            $0.forEachDepthFirst(visit)
        }
    }
}

// ******** IMPLEMENT A TREE ********
let beverages = TreeNode<String>("Beverages")          // Create the root node

let hot = TreeNode<String>("*Hot")                         // Create  a node that will be a child node to the Beverages root
let cold = TreeNode<String>("*Cold")                       // Create  a node that will be a child node to the Beverages root

// Add the child nodes hot and cold to the Beverages root node.
beverages.add(hot)
beverages.add(cold)

// Add child nodes coffee and tea to the hot node
let coffee = TreeNode<String>("-coffee")
let tea = TreeNode<String>("-tea")

hot.add(coffee)
hot.add(tea)

// Add child nodes soda and milk to the cold node
let soda = TreeNode<String>("-soda")
let milk = TreeNode<String>("-milk")

cold.add(soda)
cold.add(milk)

// Complete a depth first search of the nodes
beverages.forEachDepthFirst {
    print($0.value)
}


//: [Next](@next)
