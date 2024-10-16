import HealthKit

extension HKBiologicalSex: CustomStringConvertible {
    public var description: String {
        switch self {
        case .notSet: return "NotSet"
        case .female: return "Female"
        case .male: return "Male"
        case .other: return "Other"
        @unknown default: fatalError()
        }
    }
}

extension HKAuthorizationStatus: CustomStringConvertible {
    public var description: String {
        switch self {
        case .notDetermined: return "notDetermined"
        case .sharingAuthorized: return "sharingAuthorized"
        case .sharingDenied: return "sharingDenied"
        @unknown default: fatalError()
        }
    }
}
