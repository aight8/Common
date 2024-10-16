import Foundation

public extension FloatingPoint {
    /// [Common] Absolute value of number.
    var abs: Self {
        Swift.abs(self)
    }
}

public extension SignedInteger {
    /// [Common] Absolute value of integer number.
    var abs: Self {
        Swift.abs(self)
    }
    
    /// [Common] Greatest common divisor of integer value and n.
    func gcd(of number: Self) -> Self {
        number == 0 ? self : number.gcd(of: self % number)
    }
    
    /// [Common] Least common multiple of integer and n.
    func lcm(of number: Self) -> Self {
        (self * number).abs / gcd(of: number)
    }
}

// Greatest Common Divisor
func gcd(_ m: Int, _ n: Int) -> Int {
    var a = 0
    var b = max(m, n)
    var r = min(m, n)
    
    while r != 0 {
        a = b
        b = r
        r = a % b
    }
    return b
}

/// [Common] Greatest Common Divisor
//func gcd(_ a: Int, _ b: Int) -> Int {
//    let remainder = abs(a) % abs(b)
//    if remainder != 0 {
//        return gcd(abs(b), remainder)
//    } else {
//        return abs(b)
//    }
//}

/// [Common] Least Common Multiple
func lcm(_ m: Int, _ n: Int) -> Int {
    return m*n / gcd(m, n)
}
