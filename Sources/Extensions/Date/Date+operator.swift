import Foundation

public extension Date {
    /// [Common]
    static func -(lhs: Date, rhs: Date) -> Duration {
        .seconds(lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate)
    }
}
