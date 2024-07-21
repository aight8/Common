import SwiftUI
import SwiftData

extension FetchDescriptor where T: PersistentModel {
	public init(
		predicate: Predicate<T>? = nil,
		sortBy: [SortDescriptor<T>] = [],
		includePendingChanges: Bool = false
	) {
		self.init()
		self.predicate = predicate
		self.sortBy = sortBy
		self.includePendingChanges = includePendingChanges
	}

	public init(
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

	public init(
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
