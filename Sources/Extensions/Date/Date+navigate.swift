import Foundation

public extension Date {
    // Calendar.current.date(bySettingHour: <#T##Int#>, minute: <#T##Int#>, second: <#T##Int#>, of: <#T##Date#>)
    
    /// [Common]
//    func startOf(_ component: Calendar.Component) -> Date {
//    }

    /// [Common]
    func previous(_ component: Calendar.Component) -> Date {
        Calendar.current.date(byAdding: component, value: -1, to: self)!
    }

    /// [Common]
    func next(_ component: Calendar.Component) -> Date {
        Calendar.current.date(byAdding: component, value: 1, to: self)!
    }

    /// [Common]
    func next(_ components: DateComponents) -> Date {
        Calendar.current.nextDate(after: self, matching: components, matchingPolicy: .nextTime)!
    }

//    /// [Common]
//    func previous(_ component: Calendar.Component) -> Date {
//        Calendar.current.date(byAdding: component, value: -1, to: self)!
//    }
//    
//    /// [Common]
//    func next(_ component: Calendar.Component) -> Date {
//        Calendar.current.date(byAdding: component, value: 1, to: self)!
//    }

/// [Common] Returns the start of the corresponding day.
    var startOfDay: Date {
        Calendar.current.startOfDay(for: self)
    }
    
    /// [Common] Create the start of the year date (January 1st, 00:00:00)
    var startOfMonth: Date {
        let current = self.components()
        return Calendar.current.date(from: DateComponents(
            timeZone: current.timeZone,
            year: current.year,
            month: current.month,
            day: 1, hour: 0, minute: 0, second: 0
        ))!
    }
    
    /// [Common] Create the start of the year date (January 1st, 00:00:00)
    var startOfYear: Date {
        let current = self.components()
        return Calendar.current.date(
            from: DateComponents(
                timeZone: current.timeZone,
                year: current.year,
                month: 1, day: 1, hour: 0, minute: 0, second: 0
            )
        )!
    }
}
