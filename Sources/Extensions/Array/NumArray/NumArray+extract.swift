import Accelerate

public extension Array where Element == Double {
    /// [Common]
    func integers() -> [Int] {
        self.map({ $0.int })
    }

    /// [Common] **[vDSP]**
    func integerParts() -> [Double] {
        vForce.nearestInteger(self)
    }

    /// [Common] **[vDSP]** Returns a array containing each element in the supplied vector truncated to a fraction.
    func decimalParts() -> [Double] {
        vDSP.trunc(self)
    }
}
