//: [Previous](@previous)

import Foundation

/*
 The Insert function adds a new node at a specific spot in the Linked List
 */

// ******** LINKED LIST STRUCTURE ******** //
struct LinkedList<Value> {
    var head: Node<Value>?
    var tail:   Node<Value>?
    
    // ******** INITIALIZER ********
    init() { }
    
   // ******** TEST FOR EMPTY ********
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

        let node = Node(value: value)
        tail!.next = node
        tail = node
    }
    
    // ******** INSERT FUNCTIONS ********
    func node(at index: Int) -> Node<Value>? {

        var currIndex = 0
        var currNode = head

        while(currNode != nil && currIndex < index) {
            currNode = currNode?.next
            currIndex += 1
        }

        return currNode != nil ? currNode : tail
    }
    
    func insert(_ value: Value, after node: Node<Value>) {
        node.next = Node(value: value, next: node.next)
    }

    // ******** POP FUNCTION ********
    // Function to remove node from the head and returns the value stored at head
    mutating func pop() -> Value? {
        
        /*
         defer method is executed after the parent method returns
         After we remove the node we update the head next pointer.
         if it is empty we must also set the tail tto nil
         */
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        
        return head?.value
    }
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

// ******** CUSTOM NODE PRINT FORMAT ********.
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

list.append(10)
list.append(3)
list.append(12)
list.append(100)

// Pop off a node
print("Node value popped off = \(list.pop() ?? -99)")

//: [Next](@next)
