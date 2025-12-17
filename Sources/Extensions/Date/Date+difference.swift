import Foundation

extension Date {
    /// [Common]
    func days(between date2: Date) -> Int {
        let startOfSelf = Calendar.current.startOfDay(for: self)
        let startOfOther = Calendar.current.startOfDay(for: date2)
        let components = Calendar.current.dateComponents([.day], from: startOfSelf, to: startOfOther)
        return abs(components.day ?? 0)
    }
}
