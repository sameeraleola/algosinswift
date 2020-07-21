import UIKit

// ******** QUEUE DATA STRUCTURE ********
// Queues are  first in first out (FIFO) structures
// This of a line of people waiting to be serviced.


// ******** QUEUE STRUCTURE ******** //
struct Queue<T> {
    // Use an array to store the data
    var array : [T] = []
    
    // ******** INITIALIZER ********
    init() { }
    
    // A method to determine if the queue is empty
    var isEmpty : Bool {
        return array.isEmpty
    }
    
    // Implement the peek as a computed property
    var peek : T? {
        return array.first
    }
}


