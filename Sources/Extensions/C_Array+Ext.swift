import Foundation

public extension Array where Element: Equatable {
	func abc() {
		print("Array")
	}

	/// Basically the same as chunked method in swift-algorithms but the elements in the current groups are given as parameters of the closure.
	/// The closure should return **true** if the **next** Element belongs to the **group** of the **previous** element.
	/// Otherwise it starts a new group.
	/// - Parameters
	func chunked(by fn: ( _ next: Element, _ prev: Element, _ group: [Element]) -> Bool) -> [[Element]] {
		if self.count == 0 { return [] }
		if self.count == 1 { return [self]  }

		var groups: [[Element]] = [[self.first!]]

		for (idx, next) in self.enumerated() {
			let isFirst = idx == self.startIndex
//			let isLast = idx == self.endIndex-1

			if isFirst { continue }

			let prev = self[idx-1]

			let currentGroup = groups[groups.endIndex-1].contains(prev) ? groups[groups.endIndex-1] : []

			if fn(next, prev, currentGroup) {
				groups[groups.endIndex-1].append(next)
			} else {
				groups.append([next])
			}
		}
		return groups
	}
}
