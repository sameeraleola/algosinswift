import UIKit

/*
 ******** BINARY SEARCH ********
    1. Find the center of the list.
    2.Test that middle value against the value being searched.
    3. If the middle value is less than search value eliminate the left portion of the list.
    4. If the middle value is greater than the search value eliminate the right portion of the list.
    5. Repeat the process starting at 1.
    6. If at the end of the list then return not found.

 ******** BINARY SEARCH ALGORITHM ********
 Search Value: 31
 List: 1 -> 5 -> 15 -> 17 -> 19 -> 22 -> 24 -> 31 -> 105 -> 150
 Middle = 5th value = 22 < Search value
 Remaining list: 24 -> 31 -> 105 -> 150
 Middle = 2nd value = 105 < Search value
 Remaining list: 31 = 31
 Value found!
 
*/

// The BinaryNode class is the type used to store a binary tree node
class BinaryNode<Element> {
    var value : Element
    var leftChild : BinaryNode?
    var rightChild : BinaryNode?
    
    init(value : Element) {
        self.value = value
    }
}

// Implement the Binary Search Tree with a structure
struct BinarySearchTree<Element : Comparable> {
    private(set) var root : BinaryNode<Element>?  // This will be a custom type
    
    init() { }
}

// Create a helper to allow displaying how the Binary Search Tree is being displayed
extension BinarySearchTree : CustomStringConvertible {
    var description : String {
        guard let root = root else { return "Empty tree" }
        return String(describing: root)
    }
}
