import Foundation

public extension Date {
    /// [Common]
    var startOfDay: Date { Calendar.current.startOfDay(for: self) }

    /// [Common]
    func days(between date2: Date) -> Int {
        let startOfSelf = Calendar.current.startOfDay(for: self)
        let startOfOther = Calendar.current.startOfDay(for: date2)
        let components = Calendar.current.dateComponents([.day], from: startOfSelf, to: startOfOther)
        return abs(components.day ?? 0)
    }
    
    /// [Common]
    func dateComponents(_ components: Set<Calendar.Component>? = nil) -> DateComponents {
        if let components {
            return Calendar.current.dateComponents(components, from: self)
        }
        return Calendar.current.dateComponents(in: .current, from: self)
    }
    
    /// [Common]
    func dateComponents(matches components: DateComponents? = nil) -> Bool {
        Calendar.current.date(self, matchesComponents: .init(hour: 12))
    }
}
