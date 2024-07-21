import Foundation

// !!!: Duration = struct { int64, int64 }

public extension Duration {
	static func minutes(_ minutes: Int) -> Self { .seconds(minutes * 60) }
	static func hours(_ hours: Int) -> Self { .seconds(hours * 3600) }

	func percentage(of total: Duration) -> Percentage {
		return Percentage(self / total * 100)
	}

	init(_ value: TimeInterval) {
		self.init(secondsComponent: Int64(value), attosecondsComponent: 0)
	}
}
