import Foundation

public extension DateComponents {
    static func date(year: Int, month: Int, day: Int) -> DateComponents {
        .init(year: year, month: month, day: day)
    }

    static func time(hour: Int, minute: Int, second: Int) -> DateComponents {
        .init(hour: hour, minute: minute, second: second)
    }
}
