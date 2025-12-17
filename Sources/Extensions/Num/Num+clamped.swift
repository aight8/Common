import Swift

public extension Double {
    
    /// [Common] Double :: More specific than Comparable->clamped
    func clamped(min: Double = -.infinity, _ max: Double = .infinity) -> Double {
        Swift.max(min, Swift.min(max, self))
    }
}
