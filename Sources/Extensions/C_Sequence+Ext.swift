import Foundation

public extension Sequence {
	func abc() {
		print("Sequence")
	}

	// TODO: do this for sort()
	// TODO: asc/desc or better lowFirst, highFirst
	// TODO: use SortOrder / SortType
	func sorted<T: Comparable>(by keyPath: KeyPath<Element, T>) -> [Element] {
		return sorted { a, b in
			return a[keyPath: keyPath] < b[keyPath: keyPath]
		}
	}
}
