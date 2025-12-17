
extension Array {

    /// [Common]
    func lookaround(at index: Int) -> (previous: Element?, current: Element?, next: Element?) {
        guard indices.contains(index) else { return (nil, nil, nil) }

        let previous = index > startIndex ? self[index - 1] : nil
        let current = self[index]
        let next = index < endIndex - 1 ? self[index + 1] : nil

        return (previous, current, next)
    }

}
