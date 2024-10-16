import Foundation

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
