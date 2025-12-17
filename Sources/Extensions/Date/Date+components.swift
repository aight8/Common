import Foundation

// TODO: set/add/adding week (.weekOfMonth)
public extension Date {
    /// [Common]
    func components(_ components: Set<Calendar.Component>? = nil) -> DateComponents {
        if let components {
            return Calendar.current.dateComponents(components, from: self)
        }
        return Calendar.current.dateComponents(in: .current, from: self)
    }
    
    /// [Common]
//    func get(_ component: Calendar.Component) -> Int {
//    func subscript

    /// [Common]
    func component(_ component: Calendar.Component) -> Int {
        Calendar.current.component(component, from: self)
    }

    /// [Common]
//    func components(_ components: Set<Calendar.Component>...) -> DateComponents {
//        if let components {
//            return Calendar.current.dateComponents(components, from: self)
//        }
//        return Calendar.current.dateComponents(in: .current, from: self)
//    }
    
    mutating func set(_ value: Int, _ component: Calendar.Component) {
        self = Calendar.current.date(bySetting: component, value: value, of: self)!
    }
    
    //    mutating func set(years: Int?, months: Int?, days: Int?, hours: Int?, minutes: Int?, seconds: Int?) {
    //        if let years {
    //            self = Calendar.current.date(bySetting: .year, value: years, of: self)!
    //        }
    //        if let months {
    //            self = Calendar.current.date(bySetting: .month, value: months, of: self)!
    //        }
    //        if let days {
    //            self = Calendar.current.date(bySetting: .day, value: days, of: self)!
    //        }
    //        if let hours {
    //            self = Calendar.current.date(bySetting: .hour, value: hours, of: self)!
    //        }
    //        if let minutes {
    //            self = Calendar.current.date(bySetting: .minute, value: minutes, of: self)!
    //        }
    //        if let seconds {
    //            self = Calendar.current.date(bySetting: .second, value: seconds, of: self)!
    //        }
    //    }
    
    subscript (_ unit: Calendar.Component) -> Int {
        get { component(unit) }
        set { set(newValue, unit) }
    }
    
    //    mutating func round(graduatiy: Calendar.Component) {
    //    }
    
    //    mutating func truncate(graduatiy: Calendar.Component) {
    //    }
    
    ///
    /// # Add
    ///
    
    /// [Common]
    mutating func add(
        years: Int? = nil,
        months: Int? = nil,
        days: Int? = nil,
        hours: Int? = nil,
        minutes: Int? = nil,
        seconds: Int? = nil
    ) {
        if let years {
            self = Calendar.current.date(byAdding: .year, value: years, to: self)!
        }
        if let months {
            self = Calendar.current.date(byAdding: .month, value: months, to: self)!
        }
        if let days {
            self = Calendar.current.date(byAdding: .day, value: days, to: self)!
        }
        if let hours {
            self = Calendar.current.date(byAdding: .hour, value: hours, to: self)!
        }
        if let minutes {
            self = Calendar.current.date(byAdding: .minute, value: minutes, to: self)!
        }
        if let seconds {
            self = Calendar.current.date(byAdding: .second, value: seconds, to: self)!
        }
    }
    
    ///
    /// # Adding
    ///
    
    /// [Common]
    func added(
        years: Int? = nil,
        months: Int? = nil,
        days: Int? = nil,
        hours: Int? = nil,
        minutes: Int? = nil,
        seconds: Int? = nil
    ) -> Date {
        var newDate = self
        newDate.add(years: years, months: months, days: days, hours: hours, minutes: minutes, seconds: seconds)
        return newDate
    }
}
