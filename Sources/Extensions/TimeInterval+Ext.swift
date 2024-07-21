import Foundation

// !!!: Timeinterval = Double

public extension TimeInterval {
	func years() -> Double {
		let secondsInYear: TimeInterval = 365.25 * 24 * 60 * 60
		return self / secondsInYear
	}

	// !!!: Possibly lossy conversion from Duration
	init(_ value: Duration) {
		self = TimeInterval(value.components.seconds) + Double(value.components.attoseconds) / 1e18
	}
}

public extension TimeInterval {
	static let millisecond: TimeInterval = 0.001
	static let second: TimeInterval = 1
	static let minute: TimeInterval = 60
	static let hour: TimeInterval = 60 * 60
	static let day: TimeInterval = 60 * 60 * 24
	static let week: TimeInterval = 60 * 60 * 24 * 7

	static func millisecond(_ v: Double) -> TimeInterval { v * millisecond }
	static func second(_ v: Double) -> TimeInterval { v * second }
	static func minute(_ v: Double) -> TimeInterval { v * minute }
	static func hour(_ v: Double) -> TimeInterval { v * hour }
	static func day(_ v: Double) -> TimeInterval { v * day }
	static func week(_ v: Double) -> TimeInterval { v * week }
}
