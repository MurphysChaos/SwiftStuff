//
//  CustomOperator.swift
//  Copyright © 2020 Joel Murphy. All rights reserved.
//

import Foundation

// Custom operators are possible within Swift. There are three general categories of operator: prefix, infix, and postfix. Prefix and postfix operators are applied to a single expression.

infix operator ><
prefix operator ><
prefix operator ❤️
postfix operator *

// Swaps two values
public func >< <T>(left: T, right: T) -> (T, T) {
    return (right, left)
}

// Prefix version swaps two values of a tuple in place
public prefix func >< <T>(value: inout(T, T)) -> (T, T) {
    let (a, b) = value
    value = (b, a)
    return value
}

// Tests if a number is prime
public prefix func ❤️(value: Int) -> Bool {

    if value == 2 {
        // 2 is prime
        return true
    } else if value % 2 == 0 || value < 2 {
        // Primes are not otherwise even or less than 2
        return false
    }
    
    // Start at 3
    let root = Int(sqrt(Double(value)))
    
    for divisor in stride(from: 3, through: root, by: 2) {
        if value % divisor == 0 {
            return false
        }
    }
    
    return true
}

// Computes the square of a number
public postfix func *(value: Double) -> Double {
    return value * value
}


public class CustomOperator {

    public static func tryswap() {

        let (a, b) = (7, 12)
        let (c, d) = a >< b

        print("Using custom swap operator:")
        print("\(a) >< \(b) => \((c, d))")
        print()
    }
    
    public static func tryswap2() {

        var a = (3, 12)
        var b = ("Hello", "Goodbye")
        
        print("Using custom swap prefix operator:")
        print("><\(a) => \(><a)")
        print("><\(b) => \(><b)")
        print()
    }
    
    public static func tryprime() {
        
        let testValues: [Int] = [2, 7, 12, 15, 19, 62, 317, 1023, 2011]
        
        print("Using custom prime number operator:")
        for value in testValues {
            print("\(value) \(❤️value ? "is" : "is NOT") prime")
        }
        print()
    }
    
    public static func trysquare() {
         
        print("Using custom square operator:")
        print("Square of 4 is \(4*)")
        print()
    }
}
