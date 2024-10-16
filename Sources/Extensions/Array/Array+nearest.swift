
public extension Array where Element: Strideable {
    // TODO: nearest to value MAX-DISTANCE
    /// [Common] Finds the nearest element to the given value
    func nearest(to value: Element) -> Element? {
        guard !isEmpty else {
            return nil
        }
        return self.min(by: {
            abs($0.distance(to: value)) < abs($1.distance(to: value))
        })
    }

    /// [Common] Finds the index of the nearest element to the given value
    func nearestIndex(to value: Element) -> Int? {
        guard !isEmpty else {
            return nil
        }
        return self.enumerated().min(by: {
            abs($0.element.distance(to: value)) < abs($1.element.distance(to: value))
        })?.offset
    }
}

public extension Array {
    /// [Common] Finds the nearest element to the given value
    func nearest<T: Strideable>(to value: T, path: KeyPath<Element, T>) -> Element? {
        guard !isEmpty else {
            return nil
        }
        return self.min(by: {
            return abs($0[keyPath: path].distance(to: value)) < abs($1[keyPath: path].distance(to: value))
        })
    }
}
