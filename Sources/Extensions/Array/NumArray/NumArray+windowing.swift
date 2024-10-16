import Accelerate

public extension Array where Element == Double {
    /// [Common] **[vDSP]** Returns the sliding window sum of a vector.
    func slidingWindowSum(usingWindowLength: Int) -> [Double] {
        vDSP.slidingWindowSum(self, usingWindowLength: usingWindowLength)
    }
}
