//: [Previous](@previous)

import Foundation

/*
  ******** BINARY TREE IN ORDER TRAVERSAL ********
 In order traversal of a binary tree is a depth first traversal.
 There are three DFT orders:
     • Inorder : Begins at the left most leaf node and goes up : Left -> Root -> Right
     • Preorder : Begins at the root and visits each node in order: Root -> Left -> Right
     • Postorder : Begins on the left on all the leaf nodes on same level then to parent : Left -> Root -> Right
 
 Example binary tree used in this explaination:
                     1
                  /    \
                 2      3
                / \
               4   5
 
• Inorder Example: (Left -> Root -> Right) = 4 -> 2 -> 5 -> Root -> 1
• Preorder Example: (Root -> Left -> Right) = Root -> 2 -> 4 -> 5 -> 3
• Postorder Example: (Root -> Left -> Right) = 4 -> 5 -> 2 -> 3 -> Root
 */

//  ******** BINARY TREE DATA STRUCTURE ********
class BinaryNode<Element> {
  var value : Element
  var leftChild : BinaryNode?
  var rightChild : BinaryNode?
  
  init(_ value: Element) {
      self.value = value
  }
}

//  ******** INORDER TRAVERSAL ********
extension BinaryNode {
    func traverseInOrder(visit : (Element) -> Void) {   // Note: The closure is only included to allow printing node.
        
    }
}

//  ******** POPULATE A BINARY TREE ********
// 1. Create the nodes that will be stored in the binary tree
let ten = BinaryNode(10)
let nine = BinaryNode(9)
let eight = BinaryNode(8)
let seven = BinaryNode(7)
let six = BinaryNode(6)
let five = BinaryNode(5)
let four = BinaryNode(4)
let three = BinaryNode(3)
let two = BinaryNode(2)
let one = BinaryNode(1)

// 2. Now connect the left and right child nodes, if any.
ten.leftChild = nine
ten.rightChild = two
// -------
nine.leftChild = one
nine.rightChild = three
// -------
two.leftChild = four
two.rightChild = six

//: [Next](@next)
