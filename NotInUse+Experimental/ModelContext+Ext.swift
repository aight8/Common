import SwiftUI
import SwiftData

extension ModelContext: @retroactive CustomStringConvertible {
	public var description: String {
		return "ModelContext (\(editingState.id)\n\tAutosave: \(autosaveEnabled)\n\tInserted: \(insertedModelsArray.count)\tChanged: \(changedModelsArray.count)\tDeleted: \(deletedModelsArray.count)\tHas changed: \(self.hasChanges)"
	}

	func existingModel<T>(for objectID: PersistentIdentifier) throws -> T? where T: PersistentModel {
		if let registered: T = registeredModel(for: objectID) {
			return registered
		}

		let fetchDescriptor = FetchDescriptor<T>(
			predicate: #Predicate {
				$0.persistentModelID == objectID
			}
		)

		return try fetch(fetchDescriptor).first
	}

	// TODO:
	enum ModelState {
		case nothing
		case inserted
		case changed
		case deleted
	}

	// TODO:
	enum GeneralState {
		case missing
		case registered
		case found
	}

	// TODO:
	func state<T>(for model: T) -> (ModelState, GeneralState) where T: PersistentModel {
		let queryID = model.persistentModelID

		let registeredModel: T? = registeredModel(for: queryID)

		let fetchDescriptor = FetchDescriptor<T>(predicate: #Predicate { $0.persistentModelID == queryID })
		let fetchedModel = try! fetch(fetchDescriptor).first

		var generalState: GeneralState = .missing

		if registeredModel != nil {
			generalState = .registered
		}
		else if fetchedModel != nil {
			generalState = .found
		}

		if insertedModelsArray.compactMap({ $0 as? T }).contains(model) {
			return (.inserted, generalState)
		}
		else if changedModelsArray.compactMap({ $0 as? T }).contains(model) {
			return (.changed, generalState)
		}
		else if deletedModelsArray.compactMap({ $0 as? T }).contains(model) {
			return (.deleted, generalState)
		}

		return (.nothing, generalState)
	}
}
