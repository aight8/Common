import Foundation

public extension Double {
    /// [Common]
    /// INVEST: what is the built-int interpolated method doing??
    /// Map a double value from a range to another range. As default the destination range is 0 to 1
    /// ALIAS: remap, linear interpolation
    func interpolated(
        from sourceMin: Double,
        _ sourceMax: Double,
        to destinationMin: Double,
        _ destinationMax: Double,
        clamp: Bool = false
    ) -> Double {
        let remappedValue = destinationMin + ((self - sourceMin) / (sourceMax - sourceMin)) * (destinationMax - destinationMin)
        if clamp {
            return remappedValue.clamped(min: destinationMin, destinationMax)
        }
        return remappedValue
    }
}

//func remap(value: Double, from sourceRange: (Double, Double), to destinationRange: (Double, Double)) -> Double {
//    let (sourceMin, sourceMax) = sourceRange
//    let (destMin, destMax) = destinationRange
//    
//    // Remap the value using linear interpolation
//    let normalizedValue = (value - sourceMin) / (sourceMax - sourceMin)
//    let remappedValue = destMin + (normalizedValue * (destMax - destMin))
//    
//    return remappedValue
//}
