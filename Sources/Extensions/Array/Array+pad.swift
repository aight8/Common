
public extension Array where Element: Numeric {

    /// [Common]
    func paddedZero(leftCount: Int = 0, rightCount: Int = 0) -> [Element] {
        padded(leftCount: leftCount, rightCount: rightCount, leftValue: 0, rightValue: 0)
    }
}

public extension Array {

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
        
        var leftPad: [Element] = Array(repeating: leftValue ?? first!, count: leftCount)
        var rightPad: [Element] = Array(repeating: rightValue ?? last!, count: rightCount)

        return leftPad + self + rightPad
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
}

