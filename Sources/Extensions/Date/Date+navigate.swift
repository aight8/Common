import Foundation

public extension Date {
    /// [Common]
    mutating func previous(_ component: Calendar.Component) {
        self = Calendar.current.date(byAdding: component, value: -1, to: self)!
    }

    /// [Common]
    mutating func next(_ component: Calendar.Component) {
        self = Calendar.current.date(byAdding: component, value: 1, to: self)!
    }

    /// [Common]
    func findNext(_ match: DateComponents) -> Date {
        Calendar.current.nextDate(after: self, matching: match, matchingPolicy: .nextTime)!
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
}
