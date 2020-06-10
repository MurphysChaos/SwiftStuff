//
//  ProtocolDefaults.swift
//  Copyright © 2020 Joel Murphy. All rights reserved.
//


import Foundation

/**
 Swift doesn't support optional methods on protocols. The way around this is to create a default implementation through an extension. This works for both classes and structs.
*/

protocol ProtocolDefaults {
    
    // Optional
    var foo: [String]? { get set }
    func bar(_ arg1: Int, arg2: String) -> [Int: String]
    
    // Required
    func baz()
}

extension ProtocolDefaults {
    
    var foo: [String]? {
        get {
            return nil
        } set {
            print(foo![1])
        }
    }
    
    func bar(_ arg1: Int, arg2: String) -> [Int: String] {
        return [arg1: foo![arg1]]
    }

    // baz() is not implemented in the extension and is, therefore, required on the implementing class
}
