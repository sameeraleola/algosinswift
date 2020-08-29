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

//: [Next](@next)
