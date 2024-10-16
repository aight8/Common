
public extension Collection where Index: Numeric {
    /// [Common] The last element's index
    var lastIndex: Self.Index {
        endIndex - 1
    }
}
