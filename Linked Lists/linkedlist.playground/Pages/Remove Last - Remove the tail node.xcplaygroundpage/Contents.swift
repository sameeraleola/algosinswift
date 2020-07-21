//: [Previous](@previous)

import Foundation

/*
 The Remove Last function deletes the last node in the linked list
 */

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
    mutating func pop() -> Value? {
        
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        
        return head?.value
    }
    
   // ******** REMOVE LAST FUNCTION ********
    /*
     This removes the tail node and makes the next to last node the tail.
     This must be a mutating function because the self.nodes will be mutated.
     If there are no items in the list return early.
     If there is only a single item 
     */
    mutating func removeLast() -> Value?{
        // If the list is empty there's nothing to do but return.
        guard let head = head else { return nil}
        
        // If the head = tail just pop the head  and return the value
        guard head.next != nil else {
            return pop()
        }
        
        // The list is not empty and has more than one node so traverse the list until the tail is found.
        var prev = head
        var curr = head
        // Loop through the list until the tail is located
        // This will fall through when there is no curr node
        while let next = curr.next {
            prev = curr  // Save the pointer to the previous node
            curr = next  // Make the current node the node pointed to by next of the currentt (and previious) node
        }
        // It fell through when we reached the tail that has a next value of nil
        // The tail is now the current node
        // Set the pointer in the previous node to nil so that it does not point to the current (tail) node
        prev.next = nil
        // Make the previous node the tail node
        // Now tail and prev are the same node.
        tail = prev
        // The old tail is still the current node so we return that value
        return curr.value
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

list.push(10)
list.push(20)
list.push(30)
list.push(13)

print(list)

// Remove the last node
list.removeLast()
print(list)

// Capture the value returned from the removeList method
let lastValue = list.removeLast()
print("The last value in the tail that was removed is: \(lastValue).")

//: [Next](@next)
