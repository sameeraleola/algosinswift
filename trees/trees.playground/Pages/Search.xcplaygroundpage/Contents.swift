//: [Previous](@previous)
import Foundation

// Tree structure
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

// Queue to facilitate Breath first search
struct Queue<Element> {
    var elements : [Element] = []
    
    // Adding elements to the queue
    @discardableResult
    mutating func enqueue(_ value : Element) -> Bool {
        elements.append(value)
        return true
    }
    
    // Evaluate when at the end of the Tree
    var isEmpty : Bool {
        return elements.isEmpty
    }
    
    // Removing elements from the queue
    mutating func dequeue() -> Element? {
        return isEmpty ? nil : elements.removeFirst()
    }
}  // End of queue structure

// Depth first traversal
extension TreeNode where T : Equatable {
    func forEachDepthFirst(_ visit : (TreeNode) -> Void) {
        visit(self)
        children.forEach {
            $0.forEachDepthFirst(visit)
        }
    }
    
    // Breath first traversal
    func forEachLevelOrder (_ visit : (TreeNode) -> Void) {
        visit(self)
        var queue = Queue<TreeNode>()
        children.forEach {
            queue.enqueue($0)
        }
        while let node = queue.dequeue() {
            visit(node)
            node.children.forEach { queue.enqueue($0) }
        }
    }
    
    // Create a tree search function
    func search(_ value : T ) -> TreeNode? {
        
        var result : TreeNode?
        
        forEachLevelOrder { node in
            if node.value == value {
                result = node
            }
        }
        return result
    }
    
} // End of extension

// ******** IMPLEMENT A TREE ********
let beverages = TreeNode<String>("Beverages")

// Create children to add to the root
let hot = TreeNode<String>("Hot")
let cold = TreeNode<String>("Cold")

// Connect root node children
beverages.add(hot)
beverages.add(cold)

// Create children nodes to the Hot node
let coffee = TreeNode<String>("-coffee")
let tea = TreeNode<String>("-tea")
let soda = TreeNode<String>("-soda")
let milk = TreeNode<String>("-milk")

// Add children to hot node
hot.add(coffee)
hot.add(tea)

// Add children to cold node
cold.add(soda)
cold.add(tea)

// Search for a value in the Beverages tree
if let searchResult = beverages.search("-soda") {
    print(searchResult.value)
}

if let searchResult = beverages.search("iced coffee") {
    print(searchResult.value)
}

//: [Next](@next)
