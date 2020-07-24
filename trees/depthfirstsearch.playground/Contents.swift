import UIKit

/*
 Traversing Trees - Depth First Search
 All of the nodes in one side of the tree are visited until we reach the leaf for that side.
 Once we reach the leaf we go back to the root and traverse the other side.
 Miost often this is done using recursion.
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

// ******** DFS TRAVERSAL ALGORITHM ********
// Implemented with a closure.  The goal is to go to the node then go to each child node.
extension TreeNode {
    func forEachDepthFirst(_ visit : (TreeNode) -> Void) {
        visit(self)  // Start at the root node of the tree
        children.forEach {
            $0.forEachDepthFirst(visit)  // Recursive traversal
        }
    }
}

 // ******** IMPLEMENT A TREE ********
let beverages = TreeNode<String>("Beverages")          // Create the root node

let hot = TreeNode<String>("Hot")                         // Create  a node that will be a child node to the Beverages root
let cold = TreeNode<String>("Cold")                       // Create  a node that will be a child node to the Beverages root

// Add the child nodes hot and cold to the Beverages root node.
beverages.add(hot)
beverages.add(cold)

// Create nodes to be added to the hot root
let tea = TreeNode<String>("Tea")                         // Create  a node that will be a child node to the Hot root
let coffee = TreeNode<String>("Coffee")                 // Create  a node that will be a child node to the Hot root

// Add the child nodes to the Hot root
hot.add(tea)
hot.add(coffee)


// Add child nodes for the cold root
let soda = TreeNode<String>("Soda")                   // Create  a node that will be a child node to the Cold root
let milk = TreeNode<String>("Milk")                   // Create  a node that will be a child node to the Cold root

// Add the child nodes to the Cold root
cold.add(soda)
cold.add(milk)

// ******** DFS TRAVERSAL OF BEVERAGES ********
beverages.forEachDepthFirst {
    print($0.value)
}
