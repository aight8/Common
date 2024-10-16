import Foundation

public extension Date {
    ///
    /// # Add
    ///

    /// [Common]
    mutating func add(hours: Int, minutes: Int, seconds: Int) {
        self = Calendar.current.date(byAdding: .hour, value: hours, to: self)!
        self = Calendar.current.date(byAdding: .hour, value: minutes, to: self)!
        self = Calendar.current.date(byAdding: .hour, value: seconds, to: self)!
    }

    /// [Common]
    mutating func add(days: Int) {
        self = Calendar.current.date(byAdding: .day, value: days, to: self)!
    }

    /// [Common]
    mutating func add(weeks: Int) {
        self = Calendar.current.date(byAdding: .weekOfMonth, value: weeks, to: self)!
    }

    /// [Common]
    mutating func add(months: Int) {
        self = Calendar.current.date(byAdding: .month, value: months, to: self)!
    }
    
    ///
    /// # Adding
    ///

    /// [Common]
    mutating func adding(hours: Int, minutes: Int, seconds: Int) -> Date {
        var newDate = self
        newDate.add(hours: hours, minutes: minutes, seconds: seconds)
        return newDate
    }
    
    /// [Common]
    func adding(days: Int) -> Date {
        Calendar.current.date(byAdding: .day, value: days, to: self)!
    }
    
    /// [Common]
    func adding(weeks: Int) -> Date {
        Calendar.current.date(byAdding: .weekOfMonth, value: weeks, to: self)!
    }
    
    /// [Common]
    func adding(months: Int) -> Date {
        Calendar.current.date(byAdding: .month, value: months, to: self)!
    }
}
