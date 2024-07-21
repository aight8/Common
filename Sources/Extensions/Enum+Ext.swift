import HealthKit

extension HKBiologicalSex {
	public var stringRepresentation: String {
		switch self {
			case .notSet: return "NotSet"
			case .female: return "Female"
			case .male: return "Male"
			case .other: return "Other"
			@unknown default: fatalError()
		}
	}
}
