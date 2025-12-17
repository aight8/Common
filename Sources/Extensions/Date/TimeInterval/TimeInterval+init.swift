import Foundation

public extension TimeInterval {
    /// [Common] Possibly lossy conversion from Duration
    init(_ value: Duration) {
        self = TimeInterval(value.components.seconds) + Double(value.components.attoseconds) / 1e18
    }

    /// [Common]
    static let millisecond: TimeInterval = 0.001

    /// [Common]
    static let second: TimeInterval = 1

    /// [Common]
    static let minute: TimeInterval = 60

    /// [Common]
    static let hour: TimeInterval = 3600 /// 60 * 60

    /// [Common]
    static let day: TimeInterval = 86400 /// 60 * 60 * 24

    /// [Common]
    static func milliseconds(_ v: Double) -> TimeInterval {
        v * millisecond
    }

    /// [Common]
    static func seconds(_ v: Double) -> TimeInterval {
        v * second
    }

    /// [Common]
    static func minutes(_ v: Double) -> TimeInterval {
        v * minute
    }

    /// [Common]
    static func hours(_ v: Double) -> TimeInterval {
        v * hour
    }

    /// [Common]
    static func days(_ v: Double) -> TimeInterval {
        v * day
    }

    /// [Common]
    func days() -> Double {
        return self / (24 * 60 * 60)
    }

    /// [Common]
    func years() -> Double {
        return self / (365.25 * 24 * 60 * 60)
    }
}

