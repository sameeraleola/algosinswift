//: [Previous](@previous)

import Foundation

/*
 Breath First Traversal (BFT)
 --------------------
 • Breath first traversal may also be referred to as level order traversal.
 • Node traversal order:
 - Start at the root node
    - Go to the first child on the left
    - Go to the first child on the right
    - Go to the child of the current left node
    - Repeat the traversal across
 - When the leaf node of the right-most node is reached the BFT is done.
 
 Steps
 -----
 1.  Declare the Tree class
 2.  Declare the add method to add nodes
 3.  Create an extension on the TreeNode structure and declare the BFT which traverses each node level until the right-most leaf node is reached.
 4.  Declare a queue to queue and dequeue items from the tree.
 */

//  ******** QUEUE STRUCTURE ********
// The queue will be used to add the items found in the tree as we complete the BFS
struct Queue<Element> {
    // This array will hold the elements.  A linked list may be used instead of an array.
    var elements : [Element] = []
    
    // Create the enqueue function used to add elements to the end of the queue.
    // To get rid of the "Result of call to 'enqueue' is unused" warning message we will tell the compiler the value returned from the enqueue method can be disgarded.
    @discardableResult
    mutating func enqueue(_ value : Element) -> Bool {
        elements.append(value)
        return true
    }
    
    // Before we attempt to dequeue an element we must make sure there is an element to dequeue.
    var isEmpty : Bool {
        return elements.isEmpty
    }
    
    // Create the dequeue function used to remove the first element from the queue
    // This function returns nil if the queue is empty.  Without this the dequeue will crash because the queue has become empty and we are trying to remove an element that is not there.
    mutating func dequeue() -> Element? {
        return isEmpty ? nil : elements.removeFirst()
    }
}


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

extension TreeNode {
    // We pass in a tree node to the closure
    func forEachLevelOrder(_ visit : (TreeNode) -> Void) {
        // Call the closure and pass in the current node value
        visit(self)
        // Create the queue to keep track of the order of the nodes on a particular level.
        var queue = Queue<TreeNode>()
        // Traverse the tree and add each childe node to the queue
        children.forEach {
            queue.enqueue($0)
        }
        // Start to dequeue the elements
        while let node = queue.dequeue() {
            // get the node
            visit(node)
            // now go through the child nodes for this node and enqueue (traverse) them
            node.children.forEach {
                queue.enqueue($0)
            }
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

// Now do a BFT
beverages.forEachLevelOrder {
    print($0.value)
}

//: [Next](@next)
