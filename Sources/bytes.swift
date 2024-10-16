import Foundation

typealias Byte = UInt8
typealias Bytes = [Byte]

//extension Bytes {
//    init<T>(var value: T) {
//        let r = withUnsafePointer(&value) {
//            Array(UnsafeBufferPointer(start: UnsafePointer<Byte>($0), count: sizeof(T)))
//        }
//        self.init()
//    }
//}

//func toByteArray<T>(var value: T) -> [Byte] {
//    return withUnsafePointer(&value) {
//        Array(UnsafeBufferPointer(start: UnsafePointer<Byte>($0), count: sizeof(T)))
//    }
//}

//public extension Array {
//    func evenCount() -> Int {
//        return count.isOdd ? count : count + 1
//    }
//}

/// Returned by .enumerated()
//public extension EnumeratedSequence {
//    func array() -> Element {
//        Array(self)
//    }
//}
/// CHATGPT:
//extension EnumeratedSequence {
//    func toArray() -> [(Int, Element)] {
//        return Array(self)
//    }
//}
