//: [Previous](@previous)

import Foundation

/*
******** BINARY TREE TRAVERSAL ********
 There are three DFT orders:
     • Inorder : Begins at the left most leaf node and goes up : Left -> Root -> Right
     • Postorder : Begins on the left on all the leaf nodes on same level then to parent : Left -> Root -> Right
     • Preorder : Begins at the root and visits each node in order: Root -> Left -> Right
 
******** BINARY TREE POST ORDER TRAVERSAL ********
 Post order traversal of a binary tree is a depth first traversal.
 Example binary tree used in this explaination:
                     7
                  /    \
                 1       9
                / \    /
               0   5  8
 
 Postorder result: (Root -> Left -> Right) = 0 -> 5 -> 1 -> 8 -> 9 -> 7
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

/*
 Inorder traversal of this tree:
      10
    /    \
   9      2
  / \    / \
 1   3  4   6
 
 The traversal requires pushing visited elements onto a stack like this:
 Stack:
 10
 9
 
 Print:
 1
 */

//  ******** INORDER TRAVERSAL ********
extension BinaryNode {
    func traverseInOrder(visit : (Element) -> Void) {   // Note: The closure is only included to allow printing node.
        /*
         Step 1. If the node we are on has a left child node the recurrsive call pushes it onto the stack and
         Step 2. reads the child node
         Step 3. If the node we are on is a leaf node print it.
         Step 4. If the stack is not empty pop the stack.
         Step 5. If the node we are on has a right child node the recurrsive call pushes it onto the stack and
         Step 6. Repeat at step 1.
        */
        leftChild?.traverseInOrder(visit: visit) // Step 1: This will be called again and again pushing values onto the stack until we reach the leaf node.
        visit(value) // Print the left parent node
        rightChild?.traverseInOrder(visit: visit)
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

ten.traverseInOrder {
    print($0)
}

//: [Next](@next)
