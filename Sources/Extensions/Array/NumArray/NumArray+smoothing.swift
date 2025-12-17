import Accelerate
import Algorithms

public extension Array where Element == Double {
    
    /// [Common] **[vDSP]** Returns the 1D convolution of a vector.
    /// - Bug: https://stackoverflow.com/questions/78754704/dimension-seems-to-be-off-for-vdsp-convolve
    func convolveAccel(with kernel: [Double]) -> [Double] {
        let basePadding = kernel.count / 2
        var leftPadding = basePadding
        let rightPadding = basePadding
        if kernel.count.isOdd {
            leftPadding += 1
        }
        let arr = self.padded(leftCount: leftPadding, rightCount: rightPadding)
//        let arr = Array(repeating: self.first!, count: leftPadding) + self + Array(repeating: self.first!, count: rightPadding)

        return vDSP.convolve(arr, withKernel: kernel)
    }

    /// [Common] **[vDSP]** Returns the moving average.
    func movingAverageAccel(windowSize: Int) -> [Double] {
        vDSP.divide(vDSP.slidingWindowSum(padded(windowSize: windowSize), usingWindowLength: windowSize), Double(windowSize))
    }
}

public extension Array where Element: BinaryFloatingPoint {
    
    /// [Common] **[vDSP]** Returns the 1D convolution of a vector.
    func convolve(windowSize: Int, fn: @escaping (_ window: ArraySlice<Element>) -> Element) -> [Element] {
        return windows(ofCount: windowSize).map { window in
            fn(window)
        }
    }

    /// [Common] **[vDSP]** Returns the 1D convolution of a vector.
    func convolve(with kernel: [Element]) -> [Element] {
        let paddedArray = padded(windowSize: kernel.count)
        var result = [Element](repeating: 0.0, count: self.count)

        for i in 0..<self.count {
            var sum: Element = 0.0
            for j in 0..<kernel.count {
                sum += paddedArray[i + j] * kernel[j]
            }
            result[i] = sum
        }

        return result
    }

    /// [Common]
    func movingAverage(windowSize: Int) -> [Element] {
        guard windowSize > 0 && windowSize <= self.count else { return [] }
        
        var result = [Element]()
        let halfWindowSize = windowSize / 2
        
        for i in 0..<self.count {
            var sum: Element = 0
            var count: Element = 0
            
            // Determine the window range
            let start = Swift.max(i - halfWindowSize, 0)
            let end = Swift.min(i + halfWindowSize, self.count - 1)
            
            for j in start...end {
                sum += self[j]
                count += 1
            }
            
            let average = sum / count
            result.append(average)
        }
        
        return result
    }

    /// [Common]
    func exponentialMovingAverage(period: Int) -> [Element] {
        guard !self.isEmpty && period > 0 else {
            return []
        }

        let alpha = 2.0 / Element(period + 1)
        var emaValues: [Element] = []

        // Start with the first value as the initial EMA
        emaValues.append(self[0])
        
        // Calculate the EMA for the rest of the values
        for i in 1..<self.count {
            let previousEma = emaValues[i - 1]
            let newEma: Element = alpha * self[i] + (1 - alpha) * previousEma
            emaValues.append(newEma)
        }
        
        return emaValues
    }

}
