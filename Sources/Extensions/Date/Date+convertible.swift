import Foundation

extension Date: DoubleConvertible {
    /// [Common]
    public var double: Double {
        self.timeIntervalSinceReferenceDate
    }
}

extension Date: @retroactive RawRepresentable {
    /// [Common]
    public init(rawValue: Double) {
        self = Date(timeIntervalSinceReferenceDate: rawValue)
    }
    
    /// [Common]
    public var rawValue: Double {
        self.timeIntervalSinceReferenceDate
    }
}
