import Foundation

public extension Data {
	var prettyPrintedJSONString: NSString? {
		guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
			  let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
			  let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }

		return prettyPrintedString
	}

	var hash: String {
		self.compactMap { String(format: "%02x", $0) }.joined()
	}
}

/// let jsonData = try JSONEncoder().encode(students)
/// let jsonString = String(data: jsonData, encoding: .utf8)!
/// let prettyString = jsonString.data(using: .utf8)!.prettyPrintedJSONString!
/// print(prettyString)

public extension Data {
	struct HexEncodingOptions: OptionSet, Sendable {
		public init(rawValue: Int) { self.rawValue = rawValue }
		public let rawValue: Int

		public static let upperCase = HexEncodingOptions(rawValue: 1 << 0)
	}

	func hexEncodedString(options: HexEncodingOptions = []) -> String {
		let format = options.contains(.upperCase) ? "%02hhX" : "%02hhx"
		return self.map { String(format: format, $0) }.joined()
	}
}
