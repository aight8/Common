import Foundation

extension Date: DoubleConvertible {
    /// [Common]
    public var double: Double {
        timeIntervalSinceReferenceDate
    }
}
