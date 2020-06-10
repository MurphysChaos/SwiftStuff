import Foundation

extension MemoryLayout {
    public struct AStruct {
        var closure: ()->()
        var inty: Int
        var string: String
    }
    
    public struct BStruct {
        var a: AStruct
        var i64: Int64
        var arr: [String]
    }
    
    public static func tryit() {
        
        let a = AStruct(closure: {
            print("This is a test")
            print("123467890")
        }, inty: 53, string: "horse")
        
        let b = BStruct(a: a, i64: 11001001, arr: ["this", "is", "an", "array", "of", "strings"])
        
        print(MemoryLayout<AStruct>.size)
        print(MemoryLayout<AStruct>.size(ofValue: a))
        print(MemoryLayout<BStruct>.size)
        print(MemoryLayout<BStruct>.size(ofValue: b))
        print(MemoryLayout<[String]>.size(ofValue: b.arr))
    }
}
