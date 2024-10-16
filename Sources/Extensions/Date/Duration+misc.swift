import Foundation

public extension Duration {
    /// [Common]
    func percentage(of total: Duration) -> Percentage {
        Percentage(self / total * 100)
    }
}
