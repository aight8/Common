import Foundation
import CryptoKit

extension String {
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
