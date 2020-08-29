//: [Previous](@previous)

import Foundation

/*
  ******** BINARY TREE TRAVERSAL ********
 There are three DFT orders:
     • Inorder : Begins at the left most leaf node and goes up : Left -> Root -> Right
     • Postorder : Begins on the left on all the leaf nodes on same level then to parent : Left -> Root -> Right
     • Preorder : Begins at the root and visits each node in order: Root -> Left -> Right
 
  ******** BINARY TREE PRE ORDER TRAVERSAL ********
 Pre order traversal of a binary tree is a depth first traversal.
 Example binary tree used in this explaination:
                     1
                  /    \
                 2      3
                / \
               4   5
 
 Preorder result: (Root -> Left -> Right) = Root -> 2 -> 4 -> 5 -> 3
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
 Pre order traversal of this tree:
      10
    /    \
   9      2
  / \    / \
 1   3  4   6
 
 Result: 10 9 1 3 2 4 6
 
 */

//  ******** POST ORDER TRAVERSAL ********
extension BinaryNode {
    func traversePreOrder(visit : (Element) -> Void) {   // Note: The closure is only included to allow printing node.
        /*
         Step 1. Visit the current node.
         Step 2. If the current node has a left child visit that node.
         Step 3. If the current node has a right child visit that node.
         Step 4. Repeat at step 1.
        */
        visit(value)
        leftChild?.traversePreOrder(visit: visit)
        rightChild?.traversePreOrder(visit: visit)
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

ten.traversePreOrder {
    print($0)
}

//: [Next](@next)
