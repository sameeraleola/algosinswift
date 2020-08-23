//: [Previous](@previous)

import Foundation

/*
 Breath First Traversal
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
 3.  Create an extension on the TreeNode structure and declare
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

//: [Next](@next)
