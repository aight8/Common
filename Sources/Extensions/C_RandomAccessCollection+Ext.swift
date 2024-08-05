import Foundation

public extension RandomAccessCollection {
	func abc() {
		print("RandomAccessCollection")
	}

	public func binarySearch(where predicate: (Element) -> Bool) -> Index? {
		var intervalStart = startIndex
		var intervalEnd = endIndex

		while intervalStart != intervalEnd {
			let intervalLength = distance(from: intervalStart, to: intervalEnd)

			guard intervalLength > 1 else {
				return predicate(self[intervalStart]) ? intervalStart : nil
			}

			let testIndex = index(intervalStart, offsetBy: (intervalLength - 1) / 2)

			if predicate(self[testIndex]) {
				intervalEnd = index(after: testIndex)
			}
			else {
				intervalStart = index(after: testIndex)
			}
		}

		return nil
	}

	public func binarySearchElement(where predicate: (Element) -> Bool) -> Element? {
		let index = self.binarySearch(where: predicate)
		if let index {
			return self[index]
		}
		return nil
	}
}
