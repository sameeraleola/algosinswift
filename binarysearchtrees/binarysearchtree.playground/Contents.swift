import UIKit

/*
 Data Structures and Algorithms in Swift (Udemy)
 Section 9 : #35 - Inserting Elements into the Binary Search Tree
 */

// BinaryNode implementation
class BinaryNode<Element> {
    var value : Element
    var leftChild : BinaryNode?
    var rightChild : BinaryNode?
    
    init(value : Element) {
        self.value = value
    }
}

// This extension implements a custom print of the tree nodes.
extension BinaryNode: CustomStringConvertible {
    
    public var description: String {
        return diagram(for: self)
    }
    
    private func diagram(for node: BinaryNode?,
                         _ top: String = "",
                         _ root: String = "",
                         _ bottom: String = "") -> String {
        guard let node = node else {
            return root + "nil\n"
        }
        if node.leftChild == nil && node.rightChild == nil {
            return root + "\(node.value)\n"
        }
        return diagram(for: node.rightChild, top + " ", top + "┌──", top + "│ ")
            + root + "\(node.value)\n"
            + diagram(for: node.leftChild, bottom + "│ ", bottom + "└──", bottom + " ")
    }
}

/*
 Create the structure for the binary search tree of generic type.
 Since we will be doing search comparisons the element must conform to comparable
 A tree is only required to have a root.
 */
struct BinarySearchTree<Element : Comparable> {
    
    // Make the root a private set so that it can not be overwritten
    private(set) var root : BinaryNode<Element>?
    
    init() { }
}

// This extension implements a custom print of the tree.
extension BinarySearchTree : CustomStringConvertible {
    var description: String {
        guard let root = root else { return "Empty tree" }
        
        return String(describing : root)
    }
}

// Binary Search Tree function to insert a node into the tree
extension BinarySearchTree {
    // Since the BinarySearchTree is a struct the insert must be mutating
    mutating func insert(_ value: Element) {
        root = insert(from: root, value: value)  // insert is a helper function
    }
    
     /*
     This is a private function that should not be accessable outside of this extension.
     The node index is passed in as well as the value that is stored in that node.
     */
    private func insert(from node: BinaryNode<Element>?, value: Element) -> BinaryNode<Element> {
        // First check that there is a node being passed in.  If there isn't return the value that was passed in.
        guard let node = node else {
            return BinaryNode(value: value)
        }
        
        // If a node is being passed in then we must 
    }
}
