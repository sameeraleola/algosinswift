import UIKit

/*
 Using recursion to implement a power function.  Af power function is one of the form : y = x^n
 
 In a power function n is any real number constant.  Real numbers are all the irrational numbers such as
 the integer −5 and the fraction 4/3, and all the irrational numbers, such as √2.  Pi ( π ) is also a real number.
 
  Example of power functions: 2^3 = 2 * 2 * 2 = 8
 */

// This function requires passing in the number that will be multiplied (number)
// and the exponent which specifies how many times to multiple number (exponent)
func power(number : Int,  exponent : Int) -> Int {
    
    // Base case
    if exponent == 0 {
        return 1
    } else {
        // Recursive case                       Moving toward base case
        print("\(number) * \(exponent - 1) = \(number * exponent - 1)")
        return number * power(number: number, exponent: exponent-1)
    }
}

print(power(number: 2, exponent: 3))

/*
 What is this function doing:
 STACK
 Push: 2 * power(2, 2)  = 2*2 = 4
 Push: 2 * power(2, 1) = 4*2 = 8
 Push: 2 * power(2, 0) = 0
 */
