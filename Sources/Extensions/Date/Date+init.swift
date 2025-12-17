import Foundation

public extension Date {
    /// [Common]
//    static func first(_ c1: Calendar.Component, `in` c2: Calendar.Component) -> Date {
//        Date()
//    }

    /// [Common]
    static func current(_ component: Calendar.Component) -> Int {
        Date.now.component(component)
    }

    /// [Common]
//    static func current(_ component: Calendar.Component) -> Date {
//        Date.now.component(component)
//    }

    /// [Common]
    static func firstDateInCurrent(_ component: Calendar.Component) -> Date {
        let calendar = Calendar.current
        let currentDate = Date()

        switch component {
        case .year:
            let components = calendar.dateComponents([.year], from: currentDate)
            return calendar.date(from: components)!
            
        case .month:
            let components = calendar.dateComponents([.year, .month], from: currentDate)
            return calendar.date(from: components)!

        case .weekOfYear:
            let components = calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: currentDate)
            return calendar.date(from: components)!
            
        default:
            fatalError("Unsupported calendar component: \(component)")
        }
    }

//    /// [Common]
//    static var currentYear: Date {
//        Calendar.current.startOfDay(for: Date().added(days: 1))
//    }

//    /// [Common]
//    static var currentMonth: Date {
//        Calendar.current.startOfDay(for: Date().added(days: 1))
//    }

    /// [Common]
    static var today: Date {
        Calendar.current.startOfDay(for: Date())
    }
    
    /// [Common]
    static var yesterday: Date {
        Calendar.current.startOfDay(for: Date().added(days: -1))
    }
    
    /// [Common]
    static var tomorrow: Date {
        Calendar.current.startOfDay(for: Date().added(days: 1))
    }
    
//    /// [Common] TODO: TEST!
//    static var currentYearStart: Date {
//        Date(1, 1, Date().components().year!)
//    }
//
//    /// [Common] TODO: TEST!
//    static var currentYearEnd: Date {
//        Date(31, 12, Date().components().year!)
//    }
    
    /// [Common]
//    init(year: Int, month: Int, day: Int = 1, hour: Int = 0, minute: Int = 0, second: Int = 0) {
//        self = Date(year: year, month: month, day: day, hour: hour, minute: minute, second: second)
//    }

    /// [Common]
    init(year: Int, month: Int, day: Int = 1, hour: Int = 0, minute: Int = 0, second: Int = 0) {
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
