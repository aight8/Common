import Algorithms

public extension Array where Element: Numeric {
    
    /// [Common]
    func padded(leftCount: Int = 0, rightCount: Int = 0) -> [Element] {
        padded(leftCount: leftCount, rightCount: rightCount, leftValue: nil, rightValue: nil)
    }
}

public extension Array {
    
    ///
    /// [Common] Convenience method. Adds same padding on both sides.
    ///
    func padded(count: Int, value: Element? = nil) -> [Element] {
        return padded(leftCount: count, rightCount: count, leftValue: value, rightValue: value)
    }

    /**
     [Common] Returns a copy of the array with padded start and end.
     
     - Parameter windowSize: The amount of elements of the window.
     - Returns: A copy of the array with evenly padded start and end - automatically determinated by the given window size..
     */
    func padded(windowSize: Int) -> [Element] {
        guard !isEmpty else {
            return []
        }
        var _windowSize = windowSize
        if _windowSize < 3 { _windowSize = 3 }
        if windowSize % 2 != 1 { _windowSize -= 1 }
        let paddingSize = _windowSize / 2

        return padded(leftCount: paddingSize, rightCount: paddingSize)
    }

    /**
     [Common] Returns a copy of the array with padded start and end.

     - Parameter leftCount: Element count prepended to the array.
     - Parameter rightCount: Element count appended to the array.
     - Parameter leftValue: The element's value to prepend - if **nil** *(default)* use the **first** value of the input array.
     - Parameter rightValue: The element's value to append - if **nil** *(default)* use the **last** value of the input array.

     - Returns: A copy of the array with the given amount of prepended and appended elements of the given value (**fist** or **last** element is used by default).
     */
    func padded(
        leftCount: Int = 0,
        rightCount: Int = 0,
        leftValue: Element? = nil,
        rightValue: Element? = nil
    ) -> [Element] {
        guard !isEmpty else {
            return []
        }

        let leftPad: [Element] = Array(repeating: leftValue ?? first!, count: leftCount)
        let rightPad: [Element] = Array(repeating: rightValue ?? last!, count: rightCount)

        return leftPad + self + rightPad
    }

    // TEST PERFORMANCE
    func padded2(
        leftCount: Int = 0,
        rightCount: Int = 0,
        leftValue: Element? = nil,
        rightValue: Element? = nil
    ) -> Chain2Sequence<Chain2Sequence<[Element], [Element]>, [Element]> {
        guard !isEmpty else {
            return chain(chain([], []), [])
        }

        let leftPad: [Element] = Array(repeating: leftValue ?? first!, count: leftCount)
        let rightPad: [Element] = Array(repeating: rightValue ?? last!, count: rightCount)

        return chain(chain(leftPad, self), rightPad)
    }

    // TEST PERFORMANCE
    mutating func padded3(
        leftCount: Int = 0,
        rightCount: Int = 0,
        leftValue: Element? = nil,
        rightValue: Element? = nil
    ) {
        let leftPad: [Element] = Array(repeating: leftValue ?? first!, count: leftCount)
        let rightPad: [Element] = Array(repeating: rightValue ?? last!, count: rightCount)

        self.insert(contentsOf: leftPad, at: 0)
        self.append(contentsOf: rightPad)
    }
}
