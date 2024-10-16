import Accelerate

public extension Array where Element: BinaryFloatingPoint {
    func median() -> Double? {
        if self.isEmpty {
            return nil
        }
        let sorted_data = self.sorted()
        if self.count % 2 == 1 {
            return Double(sorted_data[Int(Foundation.floor(Double(self.count)/2))])
        } else {
            return Double(sorted_data[self.count/2]+sorted_data[(self.count/2)-1])/2
        }
    }
}

public extension Array where Element == Double {
    ///
    /// # Arithmetic
    ///
    
    /// [Common] **[vDSP]**
    /// Returns vector sum.
    func sum() -> Double {
        vDSP.sum(self)
    }

    /// [Common] Sum of all elements
    //    func sum() -> Element {
    //        reduce(0, +)
    //    }

    ///
    /// # Statistics
    ///
    
    /// [Common] **[vDSP]**
    /// Returns the median of all values.
    func median() -> Double {
        guard count > 0  else { return 0 }
        let sortedArray = self.sorted()
        if count % 2 != 0 {
            return Double(sortedArray[count/2])
        } else {
            return Double(sortedArray[count/2] + sortedArray[count/2 - 1]) / 2.0
        }
    }

    /// [Common] **[vDSP]**
    func avg() -> Double {
        vDSP.mean(self)
    }

    /// [Common] **vDSP**
    func avgMagnitude() -> Double {
        vDSP.meanMagnitude(self)
    }
    
    /// [Common] **vDSP**
    func avgSquare() -> Double {
        vDSP.meanSquare(self)
    }

    /// [Common] **vDSP**
    func rootAvgSquare() -> Double {
        vDSP.rootMeanSquare(self)
    }
    
    /// [Common] **vDSP**
    func sumOfSquares() -> Double {
        vDSP.sumOfSquares(self)
    }
    
    /// [Common] **vDSP**
    /// *BETA*
    func standardDeviation() -> Double {
        vDSP.standardDeviation(self)
    }
    
    /// [Common] **[vDSP]**
    /// Returns the correlation of a signal vector and a filter vector.
    func correlate(withKernel: [Double]) -> [Double] {
        vDSP.correlate(self, withKernel: withKernel)
    }
    
    ///
    /// # Signal Processing / Data Analysis
    ///
    
    /// [Common] **[vDSP]**
    /// Returns the number of zero crossings in a vector.
    func countZeroCrossings() -> Int {
        Int(vDSP.countZeroCrossings(self))
    }
}
