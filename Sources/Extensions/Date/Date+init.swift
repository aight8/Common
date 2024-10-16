import Foundation

public extension Date {
    /// [Common]
    static var today: Date { Calendar.current.startOfDay(for: Date()) }
    
    /// [Common]
    static var yesterday: Date { Calendar.current.startOfDay(for: Date().adding(days: -1)) }
    
    /// [Common]
    static var tomorrow: Date { Calendar.current.startOfDay(for: Date().adding(days: 1)) }
    
    /// [Common]
    init(_ day: Int, _ month: Int, _ year: Int) {
        self = Date(year: year, month: month, day: day)
    }

    /// [Common]
    init(_ day: Int, _ month: Int, _ year: Int, _ hour: Int, _ minute: Int, _ second: Int) {
        self = Date(year: year, month: month, day: day, hour: hour, minute: minute, second: second)
    }

    /// [Common]
    init(year: Int, month: Int, day: Int, hour: Int = 0, minute: Int = 0, second: Int = 0) {
        var dc = DateComponents()
        dc.calendar = .current
        dc.timeZone = TimeZone.gmt
        dc.year = year
        dc.month = month
        dc.day = day
        dc.hour = hour
        dc.minute = minute
        dc.second = second
        self = dc.date!
    }

    /// [Common]
    init(_ value: TimeInterval) {
        self = Date(timeIntervalSinceReferenceDate: value)
    }

    /// [Common]
//    init(_ str: String) {
        // 23.12.1991 and 23.12.91
        // 23.12.1991 11:11 and 23.12.91
        // 23.12.1991 11:11 and 23.12.91 11:11
//    }
}
