import Accelerate

public extension Array where Element == Double {
    ///
    /// # Minimum
    ///

    /// [Common] **[vDSP]** Returns vector minimum value.
    /// - Remark: Compared to min() returns a not-nil value and used DSP (performance?)
    func minimum() -> Double {
        vDSP.minimum(self)
    }

    /// [Common] **[vDSP]** Returns a array containing the minimum of the corresponding values of two vectors.
    func minimum(_ vectorB: [Double]) -> [Double] {
        vDSP.minimum(self, vectorB)
    }

    /// [Common] **[vDSP]** Returns the minimum value and corresponding index in a vector.
    func indexOfMinimum() -> (UInt, Double) {
        vDSP.indexOfMinimum(self)
    }

    ///
    /// # Maximum
    ///

    /// [Common] **[vDSP]** Returns vector maximum value.
    /// - Remark: Compared to max() returns a not-nil value and used DSP (performance?)
    func maximum() -> Double {
        vDSP.maximum(self)
    }

    /// [Common] **[vDSP]** Returns a array containing the maximum of the corresponding values of two vectors.
    func maximum(_ vectorB: [Double]) -> [Double] {
        vDSP.maximum(self, vectorB)
    }
    
    /// [Common] **[vDSP]** Returns the maximum value and corresponding index in a vector.
    func indexOfMaximum() -> (UInt, Double) {
        vDSP.indexOfMaximum(self)
    }
    
    ///
    /// # Maximum Magnitude
    ///

    /// [Common] **vDSP**
    func maximumMagnitude() -> Double {
        vDSP.maximumMagnitude(self)
    }
    
    /// [Common] **vDSP**
    func indexOfMaximumMagnitude() -> (UInt, Double) {
        vDSP.indexOfMaximumMagnitude(self)
    }

    /// [Common]
    /// - Remark: Use case? return closedRange instead?
    //    func range() -> ClosedRange<Double> {
    //        // TODO:
    //        let (min, max) = minAndMax()!
    //        return min...max
    //        min()!...max()!
    //        minimum()...maximum()
    //    }

}
