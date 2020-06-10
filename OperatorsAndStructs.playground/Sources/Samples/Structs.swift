//
//  Structs.swift
//  Copyright © 2020 Joel Murphy. All rights reserved.
//

import Foundation

/**
 
 There are many philosophies, found online, about when to use a struct and when to use a class in Swift. Apple has this to say on the subject:
 
 * Use structures by default.
 * Use classes when you need Objective-C interoperability.
 * Use classes when you need to control the identity of the data you're modeling.
 * Use structures along with protocols to adopt behavior by sharing implementations.
 
 Some interesting points and a few alternate opinions can be found here:
 https://stackoverflow.com/questions/24232799/why-choose-struct-over-class/24232845#24232845
  
 */

protocol SOC_StructsOrClasses {
    var foo: String { get set }
    var bar: UUID { get set }
    var baz: Range<Int> { get set }
}

// MARK: Superclass / Class Example

/**
 This is a superclass for a class-based implementation of a sample object
 */

public class SOC_Superclass: SOC_StructsOrClasses {
    
    var foo: String = "Foo"
    var bar: UUID = UUID()
    var baz: Range<Int> = Range<Int>(uncheckedBounds: (lower: 3, upper: 7))
    
    func reversedIterator() -> [IndexingIterator<Range<Int>>.Element] {
        return baz.makeIterator().reversed()
    }
}

/**
 An inheriting class for a class-based implementation of a sample object
 */

public class SOC_Class: SOC_Superclass {
    
    func cat() -> String {
        return foo + bar.description + baz.description
    }
}

// MARK: Substruct / Struct Example

/**
 This is a sample struct implementation. Instead of inheritance, object composition is used to replicate the same functionality.
 */

public struct SOC_Substruct: SOC_StructsOrClasses {
    
    var foo: String = "Foo"
    var bar: UUID = UUID()
    var baz: Range<Int> = Range<Int>(uncheckedBounds: (lower: 3, upper: 7))
    
    func reversedIterator() -> [IndexingIterator<Range<Int>>.Element] {
        return baz.makeIterator().reversed()
    }
}

/**
 This is a sample struct implementation. Instead of inheritance, object composition is used to replicate the same functionality.
 */

public struct SOC_Struct {
    
    var substruct = SOC_Substruct()
    
    func cat() -> String {
        return substruct.foo + substruct.bar.description + substruct.baz.description
    }
}
