import UIKit

/*
 A binary tree is a tree data structure that limits the number of child nodes to two or less.
 Using a binary tree to search you are able to find values in a very, very short time.
 */

//  ******** BINARY TREE DATA STRUCTURE ********
// Create the binary tree class which can store generic objects.
// The structure will hold the value that is stored at that node, the left child, and the right child
class BinaryNode<Element> {
    var value : Element
    var leftChild : BinaryNode?
    var rightChild : BinaryNode?
    
    init(_ value: Element) {
        self.value = value
    }
  }

// ******** IMPLEMENT A BINARY TREE ********
   /* A diagram of the binary tree to create
       10
     /    \
    9      2
   / \    / \
   1  3   4  6
*/
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

// 2.  Now add child nodes.
ten.leftChild = nine

// -------
nine.leftChild = one
nine.rightChild = three
// -------
ten.rightChild = two
two.leftChild = four
two.rightChild = six








