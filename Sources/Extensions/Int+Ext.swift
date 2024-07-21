import Foundation

extension Int {
	public func hexEncodedString(options: Data.HexEncodingOptions = []) -> String {
		return withUnsafeBytes(of: bigEndian) { Data($0) }.hexEncodedString(options: options)
	}
}
