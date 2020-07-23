import UIKit

/*
TREES
 The TREE data structure is made up of nodes arranged in a hierarchy.  The top most node is the root node.
 CHILD nodes are connected to the root node.  Each child node may become the root node for other child nodes attached to it.
 Tree data structures are very efficient structurs.

 Configuration
 The nodes within a tree data structure is the root, which is the first/top node in the tree
 The child which is attached to the root.
 The leaf which are the bottom most nodes that do not have any children attached
*/

//  ******** TREE DATA STRUCTURE ********
class TreeNode<T> {
    var value : T
    var children : [TreeNode] = []
    
    // ******** INITIALIZER ********
    init(_ value : T) {
        self.value = value
    }
    
    // ******** METHOD TO ADD NODES TO THE TREE ********
    func add(_ child : TreeNode) {
        self.children.append(child)
    }
}

 // ******** IMPLEMENT A TREE ********
let beverages = TreeNode<String>("Beverages")          // Create the root node

let hot = TreeNode<String>("Hot")                         // Create  a node that will be a child node to the Beverages root
let cold = TreeNode<String>("cold")                       // Create  a node that will be a child node to the Beverages root

// Add the child nodes hot and cold to the Beverages root node.
beverages.add(hot)
beverages.add(cold)

/*
 Representation of the Beverages tree
                Beverages
                 /      \
               /          \
             hot    |    cold
*/
