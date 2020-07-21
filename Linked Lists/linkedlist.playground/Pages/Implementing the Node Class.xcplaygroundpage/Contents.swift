import Foundation

// Linked Lists

/*
Description
  • A linear data structure of elements called nodes
   • The nodes are connected together by a reference that contains the address to the next node in the list.
  • There are two data elements stored in each node:
        - 1. The value held by that node.
        - 2. The address to the next node
  • The first node within a linked list is called the head.
  • The last node in a linked list is called the tail.
  • The tail node address to the next node is nil.  It does not point to anything.
 */

/*
 Required implementations needed to create and manipulate Linked Lists
 • A node class used to create individual nodes. which has a custom print description.
 • Instantiate the individual nodes to be contained in the linked list.
   There must be at least one node, the head, for the linked list to exist.  This single node is also the tail since its |next| value will be nil.
 • Push function to add nodes to the linked list structure.
 */

// Create a Linked Lists (manually)
// 1.  Create the lined list class.
class Node<Value> {     // We want to be able to store any data type within our linked list so we will specify a generic data type.
    var value: Value
    var next: Node?     // This is optional because the tail will not contain a pointer to a next node.
    
    init(value :Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

// 2.  Create a custom print description for the nodes.
extension Node: CustomStringConvertible {
    var description: String {
        guard let next = next else {
            return "\(value)"
        }
        
        return "\(value) -> " + String(describing: next) + " "
    }
}

// 3. Create nodes.
let node1 = Node(value: 1)
let node2 = Node(value: 2)
let node3 = Node(value: 3)

// 4. Link the nodes into a linked list
node1.next = node2
node2.next = node3
node3.next = nil

print(node1)



