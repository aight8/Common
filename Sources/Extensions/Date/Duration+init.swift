import Foundation

public extension Duration {
    /// [Common]
    init(_ value: TimeInterval) {
        self.init(secondsComponent: Int64(value), attosecondsComponent: 0)
    }
    
    /// [Common]
    static func minutes(_ minutes: Int) -> Self { .seconds(minutes * 60) }
    /// [Common]
    static func hours(_ hours: Int) -> Self { .seconds(hours * 3600) }
}
