import Foundation

extension Array where Element: Equatable {
	/// **Aggregate arrays**
	/// The function should answer the question:
	/// 		Does **$0** should the add to the group of the previous element **$1**
	/// 		The current elements in the group are **$3**
	func grouped(where fn: (_ prev: Element, _ next: Element, _ group: [Element]) -> Bool) -> [[Element]] {
		if self.count == 0 { return [] }
		if self.count == 1 { return [self]  }

		var groups: [[Element]] = [[first!]]

		for (idx, next) in enumerated() {
			print(self.startIndex, self.endIndex)

			let isFirst = idx == self.startIndex
			let isLast = idx == self.endIndex-1

			if isFirst { continue }

			let prev = self[idx-1]

			if fn(next, prev, groups[groups.endIndex-1]) {
				groups[groups.endIndex-1].append(next)
			} else {
				groups.append([next])
			}
		}
		return groups
	}
}
