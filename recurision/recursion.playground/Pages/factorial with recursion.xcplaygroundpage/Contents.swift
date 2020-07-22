import UIKit

/*
 Recursion is the process which a function calls itself.  The call can be a direct call or an indirect call.
 To successfully implement a recursive function three things are required:
 1.  The function must contain a base case which will eventually test true to end the recursion
 2.  The function must contain a recursive case which is the function calling itself.
 3.  The function must contain logic which moves operation toward the base case, and eventually reaching the base case.
 ---
 Each recursive call is pushed onto the stack until the base case is reached.
 When the base case is reached each call that was pushed onto the stack is popped off of the stack and executed.
 If too many recursive function calls are pushed onto the stack it can eventually cause the program to crash due to stack overload.
 */

// Implementing reursive funcion to calculate a factorial
func factorial(number : Int) -> Int {
    // The base case for the factorial function is when the number argument passed in is 0.
    // When it reaches 0 execution will stop and return a 1 (which is the correct product for the number 0)
    if number == 0 {
        return 1
    }
    
    return number * factorial(number: number - 1)
}

let value = 20
let value2 = 19
let fac = factorial(number:  value)
let fac2 = factorial(number:  value2)
let diff = fac - fac2
print("The difference between factorial \(value) and  \(value2)  = \(diff)")
