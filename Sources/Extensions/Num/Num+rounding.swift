import Foundation

/// Rounding Extension
public extension BinaryFloatingPoint {
    /// [Common]
    func roundedToNearest(multipleOf m: Self) -> Self {
        return self - self.remainder(dividingBy: m)
    }
    
    /// [Common]
    func roundedTowardZero(toMultipleOf m: Self) -> Self {
        return self - self.truncatingRemainder(dividingBy: m)
    }
    
    /// [Common]
    func roundedAwayFromZero(toMultipleOf m: Self) -> Self {
        let s = self >= 0 ? (self + m).nextDown : (self - m).nextUp
        return s - s.truncatingRemainder(dividingBy: m)
    }
    
    /// [Common]
    func roundedDown(toMultipleOf m: Self) -> Self {
        return (self < 0) ? self.roundedAwayFromZero(toMultipleOf: m)
        : self.roundedTowardZero(toMultipleOf: m)
    }
    
    /// [Common]
    func roundedUp(toMultipleOf m: Self) -> Self {
        return (self > 0) ? self.roundedAwayFromZero(toMultipleOf: m)
        : self.roundedTowardZero(toMultipleOf: m)
    }
    
    /// [Common] Returns a rounded value with the specified number of decimal places and rounding rule. If
    /// `numberOfDecimalPlaces` is negative, `0` will be used.
    ///
    ///     let num = 3.1415927
    ///     num.rounded(numberOfDecimalPlaces: 3, rule: .up) -> 3.142
    ///     num.rounded(numberOfDecimalPlaces: 3, rule: .down) -> 3.141
    ///     num.rounded(numberOfDecimalPlaces: 2, rule: .awayFromZero) -> 3.15
    ///     num.rounded(numberOfDecimalPlaces: 4, rule: .towardZero) -> 3.1415
    ///     num.rounded(numberOfDecimalPlaces: -1, rule: .toNearestOrEven) -> 3
    ///
    /// - Parameters:
    ///   - numberOfDecimalPlaces: The expected number of decimal places.
    ///   - rule: The rounding rule to use.
    /// - Returns: The rounded value.
    func rounded(numberOfDecimalPlaces: Int, rule: FloatingPointRoundingRule) -> Self {
        let factor = Self(pow(10.0, Double(max(0, numberOfDecimalPlaces))))
        return (self * factor).rounded(rule) / factor
    }

    func roundToInt() -> Int{
        Int(Darwin.round(self))
    }
}

public extension Double {
    /// [Common]
    func rounded(toPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

public extension Decimal {
    /// [Common]
    func rounded(_ roundingMode: NSDecimalNumber.RoundingMode = .plain) -> Decimal {
        var result = Decimal()
        var number = self
        NSDecimalRound(&result, &number, 0, roundingMode)
        return result
    }
}
