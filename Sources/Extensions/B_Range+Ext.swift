import Foundation

public extension Range {
	var start: Bound { lowerBound }
	var end: Bound { upperBound }
}

public extension Range where Bound == Date {
	var duration: Duration {
		self.upperBound - self.lowerBound
	}
}

//public extension RangeExpression where Bound == Date {
//}

// TODO: ClosedRange
