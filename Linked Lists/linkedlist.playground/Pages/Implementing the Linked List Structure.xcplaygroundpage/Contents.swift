//: [Previous](@previous)

import Foundation

// ******** LINKED LIST STRUCTURE ********
// Create a structure for the linked list which will hold all of the nodes
struct LinkedList<Value> {
    var head: Node<Value>?
    var tail:   Node<Value>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    // This allows the creation of a linked list just by executing the constructor
    init() { }
}

/// ******** LINKED LIST CLASS ********
class Node<Value> {
    var value: Value
    var next: Node? 
    
    init(value :Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

// ******** CUSTOM LINKED LIST PRINT FORMAT ******** //
extension Node: CustomStringConvertible {
    var description: String {
        guard let next = next else {
            return "\(value)"
        }
        
        return "\(value) -> " + String(describing: next) + " "
    }
}


// ******** INSTANTIATE A LINKED LIST ******** //
let newlist = LinkedList<String>()

let head = Node(value: "Hello")
print(head)
print(newlist.isEmpty)


//: [Next](@next)
