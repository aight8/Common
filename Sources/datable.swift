import Foundation

public protocol Datable {
    var datetime: Date { get }
}

public enum TimeOrder {
    case newToOld
    case oldToNew
}

public extension Array where Element: Datable {
    /// [Common]
    mutating func sort(_ timeOrder: TimeOrder) {
        switch timeOrder {
        case .oldToNew: sort { $0.datetime < $1.datetime }
        case .newToOld: sort { $0.datetime > $1.datetime }
        }
    }
}

/// Maybe use this.
/// I have found Foundation's SortOrder with forward and reverse
public enum SortType {
    /// aka. ascending, 1-4, A-Z, Past-Now
    case lowFirst
    /// aka. descending, 4-1, Z-A, Now-Past
    case highFirst
}
