
extension Dictionary {
    func mapKeys<T: Hashable>(_ transform: (Key) -> T) -> [T: Value] {
        return Dictionary<T, Value>(uniqueKeysWithValues: self.map { (transform($0.key), $0.value) })
    }

    func compactMapKeys<T: Hashable>(_ transform: (Key) -> T?) -> [T: Value] {
        return self.reduce(into: [:]) { (result, entry) in
            if let newKey = transform(entry.key) {
                result[newKey] = entry.value
            }
        }
    }
}
