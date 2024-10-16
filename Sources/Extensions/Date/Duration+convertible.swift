import Foundation

extension Duration: DoubleConvertible {
    /// [Common]
    public var double: Double {
        Double(self)
    }
}
