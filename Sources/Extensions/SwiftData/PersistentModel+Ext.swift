import SwiftData

public extension PersistentModel {
    var primaryKey: String {
		if let primaryKey = Mirror(reflecting: self.persistentModelID).descendant("implementation", "primaryKey") as? String {
			return primaryKey
		}
		fatalError("fail get primaryKey")
	}

	var isTemporary: Bool {
		if let isTemporary = Mirror(reflecting: self.persistentModelID).descendant("implementation", "isTemporary") as? Bool {
			return isTemporary
		}
		fatalError("fail get isTemporary")
	}
}
