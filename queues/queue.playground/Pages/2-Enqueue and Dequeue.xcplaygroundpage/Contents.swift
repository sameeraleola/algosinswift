//: [Previous](@previous)

import Foundation

// ******** QUEUE DATA STRUCTURE ********
// Queues are  first in first out (FIFO) structures
// This of a line of people waiting to be serviced.


// ******** QUEUE STRUCTURE ******** //
struct Queue<T> {
    // Use an array to store the data
    var array : [T] = []
    
    // ******** INITIALIZER ********
    init() { }
    
    // ******** CHECK FOR EMPTY QUEUE ********
    var isEmpty : Bool {
        return array.isEmpty
    }
    
    // ******** LOOK AT NEXT VALUE IN QUEUE ********
    var peek : T? {
        return array.first
    }
    
    // ******** ENQUEUE (ADD) A VALUE TO THE QUEUE O(n) ********
    mutating func enqueue( _ element : T) -> Bool {
        array.append(element)
        return true
    }
    
    // ******** DEQUEUE (ADD) A VALUE TO THE QUEUE O(n) ********
    mutating func dequeue() -> T? {
        return isEmpty ? nil : array.removeFirst()
    }
}

// ******** CUSTOM QUEUE PRINT FORMAT ********
extension Queue: CustomStringConvertible {
    var description: String {
        return String(describing: array)
    }
}

// ******** INSTANTIATE A QUEUE ********
var queue = Queue<Int>()

// ******** ADD ELEMENTS TO THE END OF THE QUEUE ********
queue.enqueue(10)
queue.enqueue(2)
queue.enqueue(34)
queue.enqueue(55)



// ******** PEEK AT FIRST ELEMENT IN QUEUE ********
print(queue.peek)

// ******** PEEK AT FIRST ELEMENT IN QUEUE ********
print(queue.dequeue())

print(queue)

//: [Next](@next)
