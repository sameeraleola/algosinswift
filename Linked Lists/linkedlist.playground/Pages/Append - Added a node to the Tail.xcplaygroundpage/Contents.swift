//: [Previous](@previous)

import Foundation

//  The Append function adds a new node to the tail of the Linked List

// ******** LINKED LIST STRUCTURE ******** //
struct LinkedList<Value> {
    var head: Node<Value>?
    var tail:   Node<Value>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    // ******** PUSH FUNCTION ********
    mutating func push(_ value: Value) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    // ******** APPEND FUNCTION ********
    mutating func append(_ value: Value) {
        // Check if the list is empty.  If it is empty the head is the tail so we can just push
        guard !isEmpty else {
            push(value)
            return
        }
        
        // The Linked List is not empty so we must update the pointers of the tail node.
        // The current tail.next should be = to the new node.
        // The new node.next is nil
        // Create a new node
        let node = Node(value: value)
        // Set the current tail to point to the new node
        tail!.next = node
        // Set the new node as the tail
        tail = node
    }
    
    // ******** INITIALIZER ********
    init() { }
}

// ******** CUSTOM LINKED LIST PRINT FORMAT ********
extension LinkedList: CustomStringConvertible {
    var description: String {
        guard let head = head else {
            return "Empy List"
        }
        return String(describing: head)
    }
}

// ******** LINKED LIST CLASS ********
class Node<Value> {
    var value: Value
    var next: Node?
    
    init(value :Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

// ******** CUSTOM NODE PRINT FORMAT ********
extension Node: CustomStringConvertible {
    var description: String {
        guard let next = next else {
            return "\(value)"
        }
        
        return "\(value) -> \(next)"
    }
}

// ******** INSTANTIATE A LINKED LIST ********
var list = LinkedList<Int>()

// Populate the linked list with 10 ->1->3
list.push(3)
list.push(1)
list.push(10)

// Append a new node with the value22
// This requires iterating through the entire linked list until we find the node with a value of node.
list.append(22)
print(list)
//: [Next](@next)
