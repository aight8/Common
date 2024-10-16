import Foundation

///public extension RangeExpression where Bound == Date {
///}

/// or: begin -> end
/// or: from -> to

public extension PartialRangeThrough {
    var end: Bound { upperBound }
}

public extension PartialRangeFrom {
    var start: Bound { lowerBound }
}

public extension Range {
    var start: Bound { lowerBound }
    var end: Bound { upperBound }
}

public extension ClosedRange {
    var start: Bound { lowerBound }
    var end: Bound { upperBound }
}

public extension Range where Bound == Date {
    var duration: Duration { self.upperBound - self.lowerBound }
}

public extension ClosedRange where Bound == Date {
    var duration: Duration { self.upperBound - self.lowerBound }
}
