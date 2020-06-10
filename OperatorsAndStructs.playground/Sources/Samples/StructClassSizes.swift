import Foundation

public class StructClassSizes {
    public struct A {
        public var ints:[Int]
    }
    
    public struct B {
        public var strs:[String]
    }
    
    public struct C {
        public var As:[A]
        public var Bs:B
    }
    
    public class D {
        public var ints:[Int]
        
        public init(ints:[Int]) {
            self.ints = ints;
        }
    }
    
    public class E {
        public var strs:[String]
        
        public init(strs:[String]) {
            self.strs = strs
        }
    }
    
    public class F {
        public var Ds:D
        public var Es:E
        
        public init(Ds: D, Es: E) {
            self.Ds = Ds
            self.Es = Es
        }
    }
    
    public class G {
        public var As:A
        public var Bs:B
        
        public init(As: A, Bs: B) {
            self.As = As
            self.Bs = Bs
        }
    }
    
    public static func tryit() {
        let ints = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        let a: A = A(ints:ints)
        let b: B = B(strs:["a", "b", "c", "d", "e", "f", "g", "h", "i", "j"])
        let c: C = C(As:[a, a, a, a], Bs: b)
        let d: D = D(ints:a.ints)
        let e: E = E(strs:b.strs)
        let f: F = F(Ds:d, Es:e)
        let g: G = G(As:a, Bs:b)
        
        print("Size of ints: \(MemoryLayout.size(ofValue: ints))")
        print("Size of a:    \(MemoryLayout.size(ofValue: a))")
        print("Size of b:    \(MemoryLayout.size(ofValue: b))")
        print("Size of c:    \(MemoryLayout.size(ofValue: c))")
        print("Size of c.As: \(MemoryLayout.size(ofValue: c.As))")
        print("Size of d:    \(MemoryLayout.size(ofValue: d))")
        print("Size of e:    \(MemoryLayout.size(ofValue: e))")
        print("Size of f:    \(MemoryLayout.size(ofValue: f))")
        print("Size of g:    \(MemoryLayout.size(ofValue: g))")
    }
}
