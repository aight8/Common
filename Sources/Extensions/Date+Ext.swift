import Foundation

//extension Date {
//	public var rawValue: Double {
//		self.timeIntervalSinceReferenceDate
//	}
//}

public extension Date {
//	public init?(rawValue: Double) {
//		self = Date(timeIntervalSinceReferenceDate: rawValue)
//	}

//	static func -(lhs: Date, rhs: Date) -> TimeInterval {
//		return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
//	}

	static func -(lhs: Date, rhs: Date) -> Duration {
//		return Duration.seconds(DateInterval(start: lhs, end: rhs).duration)
		return Duration.seconds(lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate)
	}

//	static func -(lhs: Date?, rhs: Date) -> TimeInterval {
//		guard let lhs else { return 0 }
//		return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
//	}

	init(_ year: Int, _ month: Int, _ day: Int) {
		self = Date(year: year, month: month, day: day)
	}

	init(year: Int, month: Int, day: Int) {
		var dc = DateComponents()
		dc.calendar = Calendar.current
		dc.era = 1
		dc.timeZone = TimeZone.current
		dc.year = year
		dc.month = month
		dc.day = day
		self = dc.date!
	}

	func days(between otherDate: Date) -> Int {
		let startOfSelf = Calendar.current.startOfDay(for: self)
		let startOfOther = Calendar.current.startOfDay(for: otherDate)
		let components = Calendar.current.dateComponents([.day], from: startOfSelf, to: startOfOther)
		return abs(components.day ?? 0)
	}

	static var today: Date { return Calendar.current.startOfDay(for: Date()) }
	var startOfDay: Date { return Calendar.current.startOfDay(for: self) }
	var isStartOfDay: Bool { return self == Calendar.current.startOfDay(for: self) }

	func previous(_ component: Calendar.Component) -> Date { return Calendar.current.date(byAdding: component, value: -1, to: self)! }
	func next(_ component: Calendar.Component) -> Date { return Calendar.current.date(byAdding: component, value: 1, to: self)! }

	func add(days: Int) -> Date { return Calendar.current.date(byAdding: .day, value: days, to: self)! }
	func add(weeks: Int) -> Date { return Calendar.current.date(byAdding: .weekOfMonth, value: weeks, to: self)! }
	func add(months: Int) -> Date { return Calendar.current.date(byAdding: .month, value: months, to: self)! }
}
