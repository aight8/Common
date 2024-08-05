import Foundation
import Swift
import Accelerate

public extension Array where Element: BinaryFloatingPoint {
	/// [1, 2, 3] -> 
	func normalized() -> [Element] {
		let sum = self.reduce(0, +)
		return self.map { $0 / sum }
	}

	/// Returns a copy of the array with padded start and end
	func padded(windowSize: Int) -> [Element] {
		guard windowSize > 0 && windowSize % 2 == 1 else {
			fatalError("Window/Kernel length must be an odd number")
		}
		let paddingSize = windowSize / 2
		let leftPad = Array(repeating: self.first!, count: paddingSize)
		let rightPad = Array(repeating: self.last!, count: paddingSize)
		let paddedArray = leftPad + self + rightPad
		return paddedArray
	}

//	func movingAverage(windowSize: Int) -> [Element] {
//		guard windowSize > 0 && windowSize <= self.count else { return [] }
//		var result = [Element]()
//		for i in 0..<(self.count - windowSize + 1) {
//			let window = self[i..<(i + windowSize)]
//			let average = window.reduce(0, +) / Element(windowSize)
//			result.append(average)
//		}
//		return result
//	}

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

	//	func expMovingAverage(alpha: Element) -> [Element] {
	//		guard !self.isEmpty else {
	//			return []
	//		}
	//
	//		var result = [Element]()
	//		result.append(self[0]) // Start with the first data point
	//
	//		for i in 1..<self.count {
	//			let ema = alpha * self[i] + (1 - alpha) * result[i - 1]
	//			result.append(ema)
	//		}
	//
	//		return result
	//	}

	func expMovingAverage(period: Int) -> [Element] {
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

	//	func convolve(with kernel: [Element]) -> [Element] {
	//		guard self.count >= kernel.count else { return [] }
	//		let kHalf = kernel.count / 2
	//		var result = [Element]()
	//
	//		for i in kHalf..<(self.count - kHalf) {
	//			let window = self[(i - kHalf)...(i + kHalf)]
	//			let convolved = zip(window, kernel).map(*).reduce(0, +)
	//			result.append(convolved)
	//		}
	//
	//		return result
	//	}

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
}

public extension Array where Element == Double {
	func normalizedAccel() -> [Double] {
		vDSP.normalize(self)
	}

	func movingAverageAccel(windowSize: Int) -> [Double] {
		vDSP.divide(vDSP.slidingWindowSum(padded(windowSize: windowSize), usingWindowLength: windowSize), Double(windowSize))
	}

	func convolveAccel(with kernel: [Double]) -> [Double] {
		vDSP.convolve(padded(windowSize: kernel.count), withKernel: kernel)
	}
}
