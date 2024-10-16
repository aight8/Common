import Foundation

public protocol DoubleConvertible {
    var double: Double { get }
}

public protocol IntConvertible {
    var int: Int { get }
}

extension Int: DoubleConvertible, IntConvertible {
    public var int: Int { Int(self) }
    public var double: Double { Double(self) }
}

extension Int8: DoubleConvertible, IntConvertible {
    public var int: Int { Int(self) }
    public var double: Double { Double(self) }
}

extension Int16: DoubleConvertible, IntConvertible {
    public var int: Int { Int(self) }
    public var double: Double { Double(self) }
}

extension Int32: DoubleConvertible, IntConvertible {
    public var int: Int { Int(self) }
    public var double: Double { Double(self) }
}

extension Int64: DoubleConvertible, IntConvertible {
    public var int: Int { Int(self) }
    public var double: Double { Double(self) }
}

extension UInt: DoubleConvertible, IntConvertible {
    public var int: Int { Int(self) }
    public var double: Double { Double(self) }
}

extension UInt8: DoubleConvertible, IntConvertible {
    public var int: Int { Int(self) }
    public var double: Double { Double(self) }
}

extension UInt16: DoubleConvertible, IntConvertible {
    public var int: Int { Int(self) }
    public var double: Double { Double(self) }
}

extension UInt32: DoubleConvertible, IntConvertible {
    public var int: Int { Int(self) }
    public var double: Double { Double(self) }
}

extension UInt64: DoubleConvertible, IntConvertible {
    public var int: Int { Int(self) }
    public var double: Double { Double(self) }
}

extension Float: DoubleConvertible, IntConvertible {
    public var int: Int { Int(self) }
    public var double: Double { Double(self) }
}

extension Double: DoubleConvertible, IntConvertible {
    public var int: Int { Int(self) }
    public var double: Double { self }
}

extension CGFloat: DoubleConvertible, IntConvertible {
    public var int: Int { Int(self) }
    public var double: Double { self }
}

extension Decimal: DoubleConvertible, IntConvertible {
    public var int: Int { NSDecimalNumber(decimal: self).intValue }
    public var double: Double { NSDecimalNumber(decimal: self).doubleValue }
}

public extension FloatingPoint {
    /// [Common] Radian value of degree input.
    var degreesToRadians: Self {
        Self.pi * self / Self(180)
    }

    /// [Common] Degree value of radian input.
    var radiansToDegrees: Self {
        self * Self(180) / Self.pi
    }
}
