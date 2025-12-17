
public extension Sequence {
    func toArray() -> [Element] {
        Array(self)
    }
}

extension Array where Element: Hashable {
    func toSet() -> Set<Element> {
        return Set(self)
    }
}

//extension Collection {
//    func toArray() -> [Element] {
//        Array(self)
//    }
//}
