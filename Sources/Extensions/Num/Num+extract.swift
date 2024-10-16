import Foundation

public extension Int {
    /// [Common]
    /// 123 -> [1, 2, 3]
    var digits: [Int] {
        guard self != 0 else { return [0] }
        var digits = [Int]()
        var number = abs
        
        while number != 0 {
            let xNumber = number % 10
            digits.append(xNumber)
            number /= 10
        }
        
        digits.reverse()
        return digits
    }

    /// [Common]
    /// 123 -> 3
    var digitsCount: Int {
        guard self != 0 else { return 1 }
        let number = Double(abs)
        return Int(log10(number) + 1)
    }
}

public extension Decimal {
    /// [Common]
    /// 123.456 -> 123.0
    var wholePart: Decimal {
        rounded(sign == .minus ? .up : .down)
    }

    /// [Common]
    /// 123.456 -> 0.456
    var fractionPart: Decimal {
        self - wholePart
    }

    /// [Common]
    /// 0.123 -> 123
    var fractionDigits: Int {
        let stringValue = self.description
        let components = stringValue.split(separator: ".")
        
        if components.count == 2 {
            return components[1].count
        } else {
            return 0
        }
    }
}
