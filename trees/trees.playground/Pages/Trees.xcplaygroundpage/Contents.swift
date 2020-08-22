import UIKit

/*
TREES
 Tree data structures are very efficient structurs.

 Configuration
 The nodes within a tree data structure is the root, which is the first/top node in the tree
 The TREE data structure is made up of nodes arranged in a hierarchy.  The top most node is the root node.
 CHILD nodes are connected to the root node.  Each child node may become the root node for other child nodes attached to it.
 The LEAF which are the bottom most nodes that do not have any children attached.
*/

//  ******** TREE DATA STRUCTURE ********
// The tree class values can be of any generic type.
class TreeNode<T> {
    /*
     The properties of the Tree node class are the value and the children.
     The value is the value that is stored in the node.
     The children are the nodes that are attached to the node
     */
    var value : T
    var children : [TreeNode] = []
    
    // ******** INITIALIZER ********
    // The initializer passes in the value to the node
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
let cold = TreeNode<String>("Cold")                       // Create  a node that will be a child node to the Beverages root

// Add the child nodes hot and cold to the Beverages root node.
beverages.add(hot)
beverages.add(cold)

print(beverages.children)

/*
 Representation of the Beverages tree
                Beverages
                 /      \
               /          \
             hot    |    cold
*/
