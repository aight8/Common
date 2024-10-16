import Foundation

public typealias Byte = UInt8

public extension BinaryInteger {
    /// [Common] Creates a `BinaryInteger` from a raw byte representation.
    ///
    ///     var number = Int16(bytes: [0xFF, 0b1111_1101])
    ///     print(number!)
    ///     // prints "-3"
    ///
    /// - Parameter bytes: An array of bytes representing the value of the integer.
    init?(bytes: [UInt8]) {
        // https://stackoverflow.com/a/43518567/9506784
        precondition(bytes.count <= MemoryLayout<Self>.size,
                     "Integer with a \(bytes.count) byte binary representation of '\(bytes.map { String($0, radix: 2) }.joined(separator: " "))' overflows when stored into a \(MemoryLayout<Self>.size) byte '\(Self.self)'")
        var value: Self = 0
        for byte in bytes {
            value <<= 8
            value |= Self(byte)
        }
        self.init(exactly: value)
    }
    
    /// [Common] The raw bytes of the integer.
    var bytes: [UInt8] {
        var result = [UInt8]()
        result.reserveCapacity(MemoryLayout<Self>.size)
        var value = self
        for _ in 0..<MemoryLayout<Self>.size {
            result.append(UInt8(truncatingIfNeeded: value))
            value >>= 8
        }
        return result.reversed()
    }
}

/// Redundant
//extension UInt32 {
//    var bytes: [UInt8] {
//        var bend = bigEndian
//        let count = MemoryLayout<UInt32>.size
//        let bytePtr = withUnsafePointer(to: &bend) {
//            $0.withMemoryRebound(to: UInt8.self, capacity: count) {
//                UnsafeBufferPointer(start: $0, count: count)
//            }
//        }
//        return Array(bytePtr)
//    }
//}

