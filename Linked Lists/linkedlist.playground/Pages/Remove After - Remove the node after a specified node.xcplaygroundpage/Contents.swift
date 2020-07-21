//: [Previous](@previous)

import Foundation

/*
 The Remove After function deletes a  node that is after a specified node in the linked list
 */

// ******** LINKED LIST STRUCTURE ******** //
struct LinkedList<Value> {
    var head: Node<Value>?
    var tail:   Node<Value>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    // ******** PUSH METHOD ********
    mutating func push(_ value: Value) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    // ******** APPEND METHOD ********
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
    
    // ******** INSERT METHODS ********
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

    // ******** POP METHOD ********
    mutating func pop() -> Value? {
        
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        
        return head?.value
    }
    
   // ******** REMOVE LAST METHOD ********
    mutating func removeLast() -> Value?{
        // If the list is empty there's nothing to do but return.
        guard let head = head else { return nil}
        
        // If the head = tail just pop the head  and return the value
        guard head.next != nil else {
            return pop()
        }
        
        var prev = head
        var curr = head
        
        while let next = curr.next {
            prev = curr  // Save the pointer to the previous node
            curr = next  // Make the current node the node pointed to by next of the currentt (and previious) node
        }

        prev.next = nil
        tail = prev

        return curr.value
    }
   
    // ******** REMOVE AFTER METHOD ********
    /*
     The node in front of the node given is removed.
     The method argument is the node that is in front of the node to be removed
     The value of the node removed is returned.
     */
    mutating func remove(after node: Node<Value>) -> Value? {
        // If there's only a head and tail node in the list the tail will be "removed"
        // The tail property will then be set to the head
        defer {
            // Equatale protocol is applied by using class instance identity
            if node.next === tail {
                tail = node
            }
            
            // We are passing in the node we want to keep.
            // The node to be removed to is at node.next.  Just make the node.next point to the next node's next
            node.next = node.next?.next
            print(node.next?.value)
        }
        // The node that will be removed is still being
        return node.next?.value
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

print("The list before removing the node: \n\(list)")

let index = 1
let node = list.node(at: index - 1)!
let removedValue = list.remove(after: node)

print("The list after removing the node: \n\(list)")
print("The value of the removed node is \(removedValue)")

//: [Next](@next)
