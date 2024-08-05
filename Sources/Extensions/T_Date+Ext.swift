import Foundation

extension Date: RawRepresentable {
	public init(rawValue: Double) { self = Date(timeIntervalSinceReferenceDate: rawValue) }
	public var rawValue: Double { self.timeIntervalSinceReferenceDate }
}

public extension Date {
	init(_ year: Int, _ month: Int, _ day: Int) { self = Date(year: year, month: month, day: day) }
	init(timestamp: TimeInterval) { self = Date(timeIntervalSinceReferenceDate: timestamp) }

	static func -(lhs: Date, rhs: Date) -> Duration { Duration.seconds(lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate) }

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

	static var today: Date { Calendar.current.startOfDay(for: Date()) }

	var timestamp: TimeInterval { self.timeIntervalSinceReferenceDate }

	func days(between otherDate: Date) -> Int {
		let startOfSelf = Calendar.current.startOfDay(for: self)
		let startOfOther = Calendar.current.startOfDay(for: otherDate)
		let components = Calendar.current.dateComponents([.day], from: startOfSelf, to: startOfOther)
		return abs(components.day ?? 0)
	}

	var startOfDay: Date { Calendar.current.startOfDay(for: self) }
	var isStartOfDay: Bool { self == Calendar.current.startOfDay(for: self) }

	func previous(_ component: Calendar.Component) -> Date { Calendar.current.date(byAdding: component, value: -1, to: self)! }
	func next(_ component: Calendar.Component) -> Date { Calendar.current.date(byAdding: component, value: 1, to: self)! }

	func add(days: Int) -> Date { Calendar.current.date(byAdding: .day, value: days, to: self)! }
	func add(weeks: Int) -> Date { Calendar.current.date(byAdding: .weekOfMonth, value: weeks, to: self)! }
	func add(months: Int) -> Date { Calendar.current.date(byAdding: .month, value: months, to: self)! }

	func isAfter(_ other: Date, maxFuture: Duration = .zero) -> Bool { other > self && (maxFuture == .zero || (other - self) <= maxFuture) }
	func isBefore(_ other: Date, maxPast: Duration = .zero) -> Bool { self > other && (maxPast == .zero || ((self - other) <= maxPast)) }
}
