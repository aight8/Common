import Swift

extension Comparable {
    /// [Common] Returns true if value is in the provided range.
    ///
    ///    1.isBetween(5...7) // false
    ///    7.isBetween(6...12) // true
    ///    date.isBetween(date1...date2)
    ///    "c".isBetween(a...d) // true
    ///    0.32.isBetween(0.31...0.33) // true
    ///
    /// - Parameter range: Closed range against which the value is checked to be included.
    /// - Returns: `true` if the value is included in the range, `false` otherwise.
//    func isBetween(_ range: ClosedRange<Self>) -> Bool {
//        return range ~= self
//
//    }
///    - Note: USE THIS INSTEAD:
///    range.contains(T##element: Comparable##Comparable)

    /// [Common] Returns value limited within the provided range.
    ///
    ///     1.clamped(to: 3...8) // 3
    ///     4.clamped(to: 3...7) // 4
    ///     "c".clamped(to: "e"..."g") // "e"
    ///     0.32.clamped(to: 0.1...0.29) // 0.29
    ///
    /// - Parameter range: Closed range that limits the value.
    /// - Returns: A value limited to the range, i.e. between `range.lowerBound` and `range.upperBound`.
    ///
    /// https://stackoverflow.com/questions/36110620/standard-way-to-clamp-a-number-between-two-values-in-swift
    ///
    func clamped(to r: ClosedRange<Self>) -> Self {
        let min = r.lowerBound, max = r.upperBound
        return self < min ? min : (max < self ? max : self)
    }
}

// TODO: TEST
public func clamp<T>(_ value: T, minValue: T, maxValue: T) -> T where T : Comparable {
    return min(max(value, minValue), maxValue)
}

// TODO: TEST
// https://stackoverflow.com/questions/36110620/standard-way-to-clamp-a-number-between-two-values-in-swift
@propertyWrapper
struct Clamping<Value: Comparable> {
    var value: Value
    let range: ClosedRange<Value>

    init(wrappedValue: Value, _ range: ClosedRange<Value>) {
        precondition(range.contains(wrappedValue))
        self.value = wrappedValue
        self.range = range
    }

    var wrappedValue: Value {
        get { value }
        set { value = min(max(range.lowerBound, newValue), range.upperBound) }
    }
}

