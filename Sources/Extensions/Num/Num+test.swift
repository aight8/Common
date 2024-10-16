import Foundation

public extension FloatingPoint {
    /// [Common] Check if number is positive.
    var isPositive: Bool { self > 0 }

    /// [Common] Check if number is negative.
    var isNegative: Bool { self < 0 }
}

public extension SignedInteger {
    /// [Common] Check if integer is positive.
    var isPositive: Bool { self > 0 }
    
    /// [Common] Check if integer is negative.
    var isNegative: Bool { self < 0 }
    
    /// [Common] Check if integer is even. (gerade)
    var isEven: Bool { (self % 2) == 0 }
    
    /// [Common] Check if integer is odd. (ungerade)
    var isOdd: Bool { (self % 2) != 0 }
}
