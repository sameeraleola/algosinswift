//: [Previous](@previous)

import Foundation

/*
 The Push function adds the new node to the head of the Linked List
 */

// ******** LINKED LIST STRUCTURE ******** //
struct LinkedList<Value> {
    var head: Node<Value>?
    var tail:   Node<Value>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    // Create the Linked List push method which will add the new node to the head.
    // The function must be a mutating function.
    mutating func push(_ value: Value) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    // ******** INITIALIZER ********
    init() { }
}

// ******** CUSTOM LINKED LIST PRINT FORMAT ******** //
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
list.push(1)
list.push(3)
//list.push(22)

print("list.head? = \(list.head) :: list.head?.next = \(list.head?.next)")
print(list.tail?.value)

//: [Next](@next)
