//: [Previous](@previous)

import Foundation

/*
 The Insert function adds a new node at a specific spot in the Linked List
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
        guard !isEmpty else {
            push(value)
            return
        }

        let node = Node(value: value)
        tail!.next = node
        tail = node
    }
    
    
    // ******** INSERT FUNCTIONS ********
    /*
     This function inserts a node between other nodes
     1.  Move the node that is in the position where the new node will be inserted: 10 -> 1 -> 3 becomes 10 -> 1 -> |new node| -> 3
     We want the node because we have to update the pointers for the node at that index.
     It requires 2 functions:
        The node function the node at the desired index.
        The actual insert function which creates a new node and updates the old and inserted next pointers.
     To
        1. Fnd the node at the desired index.  T
           The returned value must be an optional because the index we specify may not exist (no node at that index).
     */
    // Find the node at the desired index.  The function takes an index and returns the Node at that location or the head which is the node at 0
    func node(at index: Int) -> Node<Value>? {
        // We have to go one by one to look for the particular index, starting at index 0 which is the head
        var currIndex = 0
        var currNode = head
        // Use a while loop because we don't know how many nodes will be checked.
        // Search while the currNode != nil and the currIndex is < the node we are seeking.
        while(currNode != nil && currIndex < index) {
            // Go to the next node then increment the index.
            currNode = currNode?.next
            currIndex += 1
        }
        // While loop concludes so return the node   guard currNode?.next != nil else { return tail}
        // If there are no nodes the node that will be retruned is 0 and that is where the node will be inserted!
        return currNode != nil ? currNode : tail
    }
    
    // Insert to actually insert the node into the linked list by updating the next pointer of the node behind to point to the new node,
    // and updates the new node to point to the node in front of the insert point.
    func insert(_ value: Value, after node: Node<Value>) {
        // Create a new node and update the current node to point to it.  Set next of the new node to next of the old (currNode).
        node.next = Node(value: value, next: node.next)
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

list.append(10)
list.append(3)
list.append(12)
list.append(100)

// To insert a new node get the node where you will insert
let value = 999
let insertLocation = list.node(at: 20)
list.insert(value, after: insertLocation!)
print(list)

//: [Next](@next)
