import UIKit

// ******** STACK DATA STRUCTURE ********
// Stacks are  last in first out LIFO structures

// Create a structure that will serve as the stack
struct Stack<Element> {
    private var storage : [Element] = []
    
    // ******** INITIALIZER ********
    init() {}
    
    // ******** PUSH ELEMENTS ONTO THE STACK ********
    mutating func push(_ element : Element) {
        storage.append(element)
    }


    // ******** POP ELEMENTS OFF OF THE STACK ********
    // We are returning the node value that has been popped
    mutating func pop()  -> Element?{
        return storage.popLast()
    }
    
    // ******** LOOK AT LAST ELEMENT ON THE STACK ********
    // We are returning the node value that has been popped
    func peek()  -> Element?{
        return storage.last
    }
}

// ******** CUSTOM STACK PRINT FORMAT ********
extension Stack: CustomStringConvertible {
    var description: String {
        let title = "\n*****LIFO Stack*****\n"
        let topDivider = "------top*(FO)------\n"
        let bottomDivider = "\n----bottom*(LI)-----"
        
        let stackElements = storage.map { "\($0)" }.reversed().joined(separator: "\n")
        return title + topDivider + stackElements + bottomDivider
    }
}

// ******** INSTANTIATE A STACK ********
var stack = Stack<Int>()

stack.push(10)
stack.push(20)
stack.push(30)
print(stack)
stack.pop()
print(stack)
stack.push(40)
print(stack)


