import Foundation

public extension Double {
    mutating func interpolate(from srcMin: Double, _ srcMax: Double, to dstMin: Double, _ dstMax: Double,clamp: Bool = false) {
        self = interpolated(from: srcMin, srcMax, to: dstMin, dstMax, clamp: clamp)
    }

    /// [Common]
    /// INVEST: what is the built-int interpolated method doing??
    /// Map a double value from a range to another range. As default the destination range is 0 to 1
    /// ALIAS: remap, linear interpolation
    func interpolated(from srcMin: Double, _ srcMax: Double, to dstMin: Double, _ dstMax: Double, clamp: Bool = false) -> Double {
        let remappedValue = dstMin + ((self - srcMin) / (srcMax - srcMin)) * (dstMax - dstMin)
        if clamp {
            return remappedValue.clamped(min: dstMin, dstMax)
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
