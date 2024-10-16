import Foundation

public extension Date {
    /// [Common]
    var isStartOfDay: Bool {
        self == Calendar.current.startOfDay(for: self)
    }

    /// [Common]
    var isYesterday: Bool {
        Calendar.current.isDateInYesterday(self)
    }
    
    /// [Common]
    var isToday: Bool {
        Calendar.current.isDateInToday(self)
    }
    
    /// [Common]
    var isTomorrow: Bool {
        Calendar.current.isDateInTomorrow(self)
    }
    
    /// [Common]
    func isSame(_ toGranularity: Calendar.Component, as date2: Date) -> Bool {
        Calendar.current.isDate(self, equalTo: date2, toGranularity: .day)
    }

    /// [Common]
    func isSameDayAs(_ date2: Date) -> Bool {
        Calendar.current.isDate(self, inSameDayAs: date2)
    }
    
    ///
    /// Distance to
    ///

    /// [Common]
    func distance(to date2: Date, is range: Range<Duration>) -> Bool {
        distance(to: date2, is: range.lowerBound...) && distance(to: date2, is: ..<range.upperBound)
    }

    /// [Common]
    func distance(to date2: Date, is range: ClosedRange<Duration>) -> Bool {
        distance(to: date2, is: range.lowerBound...) && distance(to: date2, is: ...range.upperBound)
    }

    /// [Common]
    func distance(to date2: Date, is range: PartialRangeFrom<Duration>) -> Bool {
        ((date2 - self) >= range.lowerBound)
    }

    /// [Common]
    func distance(to date2: Date, is range: PartialRangeThrough<Duration>) -> Bool {
        ((date2 - self) <= range.upperBound)
    }

    /// [Common]
    func distance(to date2: Date, is range: PartialRangeUpTo<Duration>) -> Bool {
        ((date2 - self) < range.upperBound)
    }
    
    ///
    /// Is before / after
    ///

    /// [Common]
    /// TODO: REMOVE
    func `is`(max: Duration = .zero, after other: Date) -> Bool {
        self >= other
        && (max == .zero || ((self - other) <= max))
    }

    /// [Common]
    /// TODO: REMOVE 
    func `is`(max: Duration = .zero, before other: Date) -> Bool {
        self <= other
        && (max == .zero || ((other - self) <= max))
    }
    
    //    func in(range: ClosedRange<Duration>, of date2: Date) -> Bool {
    //        self >= other && (max == .zero || ((self - other) <= max))
    //    }
    
    /// [Common]
    //    func `is`(_ minMax: ClosedRange, after other: Date) -> Bool {
    //        self >= other
    //        && (max == .zero || ((self - other) <= max))
    //
    //        (Date()...Date()).contains(/*T##element: Date##Date*/)
    //    }
    
    //    func isAfter(_ other: Date, maxFuture: Duration = .zero) -> Bool { other > self && (maxFuture == .zero || (other - self) <= maxFuture) }
    //  func isBefore(_ other: Date, maxPast: Duration = .zero) -> Bool { self > other && (maxPast == .zero || ((self - other) <= maxPast)) }
    
    // isMaxAfter(_ other: Date)
    // isMaxBefore(_ other: Date)
}
