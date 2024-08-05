import Foundation

public extension Duration {
	init(_ value: TimeInterval) { self.init(secondsComponent: Int64(value), attosecondsComponent: 0) }

	static func minutes(_ minutes: Int) -> Self { .seconds(minutes * 60) }
	static func hours(_ hours: Int) -> Self { .seconds(hours * 3600) }

	func percentage(of total: Duration) -> Percentage {  Percentage(self / total * 100) }
}
