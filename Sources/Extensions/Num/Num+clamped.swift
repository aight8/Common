import Swift

public extension Double {
    /// [Common]
    /// [Common] More specific than Comparable->clamped
    func clamped(min: Double = -.infinity, _ max: Double = .infinity) -> Double {
        Swift.max(min, Swift.min(max, self))
    }
}
