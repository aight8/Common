import Foundation

public extension Date {
    /// [Common]
    func formatted(time: Date.FormatStyle.TimeStyle) -> String {
        formatted(date: .omitted, time: .shortened)
    }
    
    /// [Common]
    func formatted(date: Date.FormatStyle.DateStyle) -> String {
        formatted(date: date, time: .omitted)
    }
}
