import HealthKit
import CoreBluetooth

///
/// HealthKit
///

extension HKBiologicalSex: CustomStringConvertible {
    public var description: String {
        switch self {
        case .notSet: "notSet"
        case .female: "female"
        case .male: "male"
        case .other: "other"
        @unknown default: ""
        }
    }
}

extension HKAuthorizationStatus: CustomStringConvertible {
    public var description: String {
        switch self {
        case .notDetermined: "notDetermined"
        case .sharingAuthorized: "sharingAuthorized"
        case .sharingDenied: "sharingDenied"
        @unknown default: ""
        }
    }
}

///
/// CoreBluetooth
///

extension CBPeripheralState: @retroactive CustomStringConvertible {
    public var description: String {
        switch self {
        case .connected: "connected"
        case .connecting: "connecting"
        case .disconnected: "disconnected"
        case .disconnecting: "disconnecting"
        @unknown default: ""
        }
    }
}

extension CBManagerState: @retroactive CustomStringConvertible {
    public var description: String {
        switch self {
        case .poweredOn: "poweredOn"
        case .poweredOff: "poweredOff"
        case .resetting: "resetting"
        case .unauthorized: "unauthorized"
        case .unknown: "unknown"
        case .unsupported: "unsupported"
        @unknown default: ""
        }
    }
}

extension CBCharacteristicWriteType: @retroactive CustomStringConvertible {
    public var description: String {
        switch self {
        case .withResponse: "withResponse"
        case .withoutResponse: "withoutResponse"
        @unknown default: ""
        }
    }
}

extension CBConnectionEvent: @retroactive CustomStringConvertible {
    public var description: String {
        switch self {
        case .peerConnected: "peerConnected"
        case .peerDisconnected: "peerDisconnected"
        @unknown default: ""
        }
    }
}

extension CBManagerAuthorization: @retroactive CustomStringConvertible {
    public var description: String {
        switch self {
        case .allowedAlways: "allowedAlways"
        case .denied: "denied"
        case .notDetermined: "notDetermined"
        case .restricted: "restricted"
        @unknown default: ""
        }
    }
}

extension CBPeripheralManagerConnectionLatency: @retroactive CustomStringConvertible {
    public var description: String {
        switch self {
        case .high: "high"
        case .low: "low"
        case .medium: "medium"
        @unknown default: ""
        }
    }
}
