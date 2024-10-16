import SwiftUI
import SwiftData

public extension FetchDescriptor where T: PersistentModel {
	init(
		predicate: Predicate<T>? = nil,
		sortBy: [SortDescriptor<T>] = [],
		includePendingChanges: Bool = false
	) {
		self.init()
		self.predicate = predicate
		self.sortBy = sortBy
		self.includePendingChanges = includePendingChanges
	}

	init(
		predicate: Predicate<T>? = nil,
		sortBy: [SortDescriptor<T>] = [],
		includePendingChanges: Bool = false,
		limit: Int? = nil,
		offset: Int? = nil
	) {
		self.init()
		self.predicate = predicate
		self.sortBy = sortBy
		self.includePendingChanges = includePendingChanges
		self.fetchLimit = limit
		self.fetchOffset = offset
	}

	init(
		predicate: Predicate<T>? = nil,
		sortBy: [SortDescriptor<T>] = [],
		includePendingChanges: Bool = false,
		limit: Int? = nil,
		offset: Int? = nil,
		propertiesToFetch: [PartialKeyPath<T>],
		relationshipKeyPathsForPrefetching: [PartialKeyPath<T>]
	) {
		self.init()
		self.predicate = predicate
		self.sortBy = sortBy
		self.includePendingChanges = includePendingChanges
		self.fetchLimit = limit
		self.fetchOffset = offset
		self.propertiesToFetch = propertiesToFetch
		self.relationshipKeyPathsForPrefetching = relationshipKeyPathsForPrefetching
	}
}
