import SwiftData


extension HistoryTombstone {
	subscript<T>(keyPath: KeyPath<Model, T>) -> T {
		let mirror = Mirror(reflecting: self)
		guard
			let storageChild = mirror.children.first(where: { $0.label == "storage" }),
			let dictionary = storageChild.value as? [PartialKeyPath<Model> : Any],
			let value = dictionary[keyPath] as? T
		else {
			fatalError("Missing expected tombstone value for \(keyPath)")
		}

		return value
	}
}
