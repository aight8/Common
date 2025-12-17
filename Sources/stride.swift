
func stride<T: Comparable & Numeric & FloatingPoint>(
    from start: T,
    to end: T,
    steps: Int
) -> [T] {
    guard steps > 1 else {
        return [start]  // If only 1 step, return the start value
    }

    let stepSize = (end - start) / T(steps - 1)
    var result: [T] = []
    
    for i in 0..<steps {
        let value = start + (T(i) * stepSize)
        result.append(value)
    }
    
    return result
}
