import Accelerate

public extension Array where Element == Double {
    /// - Remark: TODO: Use case?
    /// [Common] **[vDSP]** Returns a gathered copy of the specified vector using a vector that defines the indices to keep.
//    func gather(indices: [UInt]) -> [Double] {
//        vDSP.gather(self, indices: indices)
//    }

    /// - Remark: TODO: Use case?
    /// [Common] **[vDSP]** Returns a compressed copy of the specified vector using the nonzero values in a gating vector.
//    func compress(gatingVector: [Double], nonZeroGatingCount: Int? = nil) -> [Double] {
//        precondition(count == gatingVector.count, "The number of elements in the gating vector must equal the number of elements in the vector.")
//        return vDSP.compress(self, gatingVector: gatingVector, nonZeroGatingCount: nonZeroGatingCount)
//    }

    /// - Remark: TODO: Use case?
    /// [Common] **[vDSP]** Compares values from source vector to `limit`.
    /// For inputs greater than or equal to `limit`, `outputConstant` is written to `result`.
    /// For inputs less than `limit`, the negated value of `outputConstant` is written to `result`.
//    func limit(limit: Double, withOutputConstant: Double) -> [Double] {
//        vDSP.limit(self, limit: limit, withOutputConstant: withOutputConstant)
//    }
}
