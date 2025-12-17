import Accelerate

/**
 # Normalizers
 - MinMax, MinMax(toRange), Max, L1, L2, Mean, ZScore
 */
public extension Array where Element: BinaryFloatingPoint {
    /**
     [Common] Min-Max Normalization
     - MIN to MAX ---> 0 to 1
     */
    func normalizedMinMax() -> [Element] {
        guard let minVal = self.min(), let maxVal = self.max(), minVal != maxVal else {
            return self // If all values are the same, normalization is undefined
        }
        return map { ($0 - minVal) / (maxVal - minVal) }
    }

    /**
     [Common] Min-Max Normalization
     - MIN to MAX ---> "lower" to "upper"
     */
    func normalizedMinMax(to dst: ClosedRange<Element> = 0...1) -> [Element] {
        let src = (self.min()!...self.max()!)
        let srcExtent = src.start - src.end
        guard srcExtent != 0 else { return [] }
        let dstExtent = dst.start - dst.end
        let factor = dstExtent / srcExtent
        return map { dst.lowerBound + (($0 - src.lowerBound) * factor) }
    }

    /**
     [Common] Max Normalization
     - 0 to MAX ---> 0 to 1
     - MIN to 0 ---> -n to 0
     */
    func normalizedMax() -> [Element] {
        guard let maxVal = self.max(), maxVal != 0 else {
            return self // Avoid division by zero
        }
        return map { $0 / maxVal }
    }

    /**
     [Common] L1 Normalization (Manhattan Distance)
     - SUM of OUT Elements = 1
     - OUT Element = IN Element / sum( abs( ALL Elements ) )
     */
    func normalizedL1() -> [Element] {
        let l1Norm = reduce(0) { $0 + abs($1) }
        guard l1Norm != 0 else {
            return self // Avoid division by zero
        }
        return map { $0 / l1Norm }
    }

    /**
     [Common] L2 Normalization (Euclidean Distance)
     - OUT Element = IN Element / root ( sum( ALL Elements SQUARE ) )
     */
    func normalizedL2() -> [Element] {
        let l2Norm = sqrt(reduce(0) { $0 + $1 * $1 })
        guard l2Norm != 0 else {
            return self // Avoid division by zero
        }
        return map { $0 / l2Norm }
    }
}

public extension Array where Element == Double {
    /**
     [Common] Mean Normalization
     - SUM of OUT Elements = 0
     - Centers around mean (average)
     */
    func normalizedMean() -> [Double] {
        guard let minVal = self.min(), let maxVal = self.max(), minVal != maxVal else {
            return self // If all values are the same, normalization is undefined
        }
        let meanVal = reduce(0, +) / Double(count)
        return map { ($0 - meanVal) / (maxVal - minVal) }
    }
 
    /**
     [Common] Z-Score Normalization (Standardization)
     - SUM of OUT Elements = 0
     - Centers around 0 which is the mean, scales by std deviation
     - Standardizes data to have a mean of 0 and standard deviation of 1 by subtracting the mean and dividing by the standard deviation
     */
    func normalizedZScore() -> [Double] {
        let meanVal = avg()
        let variance = reduce(0) { $0 + pow($1 - meanVal, 2) } / Double(count)
        let stdDev = sqrt(variance) /// self.standardDeviation()
        guard stdDev != 0 else {
            return self // Avoid division by zero
        }
        return map { ($0 - meanVal) / stdDev }
    }

    /**
     [Common] **[vDSP]** *BETA*
     
     - Remark: Outputs the same as normalizedZScore **(compare Performance)**
     - Remark: Mean + Std derivation is used for the calculation
     
     # Input & Output
     - Centers around 0 which is the mean, scales by std deviation
     */
    func normalizedZScoreAccel() -> [Double] {
        vDSP.normalize(self)
    }
}
