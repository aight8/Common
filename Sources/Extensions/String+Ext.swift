import Foundation
import CryptoKit

extension String {

    /// [Common]
    func isin(_ substrings: [String]) -> Bool {
        return substrings.contains { self.contains($0) }
    }

}

public extension String {

    /// [Common]
    func prefixing(_ fn: @escaping () -> String) -> String {
        fn() + self
    }

    /// [Common]
    func suffixing(_ fn: @escaping () -> String) -> String {
        self + fn()
    }

}

public extension String {

    /// [Common]
    static func random(length: Int = 20) -> String {
        let base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var randomString: String = ""
        
        for _ in 0..<length {
            let randomValue = arc4random_uniform(UInt32(base.count))
            randomString += "\(base[base.index(base.startIndex, offsetBy: Int(randomValue))])"
        }
        return randomString
    }

}

public extension String {

    /// [Common]
    var wordCount: Int {
        let regex = try? NSRegularExpression(pattern: "\\w+")
        return regex?.numberOfMatches(in: self, range: NSRange(location: 0, length: self.utf16.count)) ?? 0
    }

}

extension String {

    var length: Int {
        return count
    }

    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }

    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }

    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }

    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}

//let A = Character("A").unicodeScalars.first!.value
//let C = Character("C").unicodeScalars.first!.value
//for (key, (x, y)) in product(A...C, A...C).enumerated() {
//    print(key, Character(UnicodeScalar(x)!), Character(UnicodeScalar(y)!))
//}

//extension String {
//	func sha1() -> String {
//		let data = Data(self.utf8)
//		var digest = [UInt8](repeating: 0, count:Int(CC_SHA1_DIGEST_LENGTH))
//		data.withUnsafeBytes {
//			_ = CC_SHA1($0.baseAddress, CC_LONG(data.count), &digest)
//		}
//		let hexBytes = digest.map { String(format: "%02hhx", $0) }
//		return hexBytes.joined()
//	}
//}
