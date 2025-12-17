import Foundation

public extension Array where Element: Comparable {
    
    /// [Common] Convenience method
//    mutating func sortToMax() {
//        //        sort { $0 < $1 }
//        sort()
//    }

    /// SwifterSwift: Sort an array like another array based on a key path. If the other array doesn't contain a certain
    /// value, it will be sorted last.
    ///
    ///        [MyStruct(x: 3), MyStruct(x: 1), MyStruct(x: 2)].sorted(like: [1, 2, 3], keyPath: \.x)
    ///            -> [MyStruct(x: 1), MyStruct(x: 2), MyStruct(x: 3)]
    ///
    /// - Parameters:
    ///   - otherArray: array containing elements in the desired order.
    ///   - keyPath: keyPath indicating the property that the array should be sorted by
    /// - Returns: sorted array.
//    func sorted<T: Hashable>(like otherArray: [T], keyPath: KeyPath<Element, T>) -> [Element] {
//        let dict = otherArray.enumerated().reduce(into: [:]) { $0[$1.element] = $1.offset }
//        return sorted {
//            guard let thisIndex = dict[$0[keyPath: keyPath]] else { return false }
//            guard let otherIndex = dict[$1[keyPath: keyPath]] else { return true }
//            return thisIndex < otherIndex
//        }
//    }
}

public extension Sequence {
    
//    public func sorted<Value: Comparable>(
//        by keyPath: KeyPath<Self.Element, Value>
//    ) -> [Self.Element] {
//        return self.sorted { a, b in
//            a[keyPath: keyPath] < b[keyPath: keyPath]
//        }
//    }

//    func sorted<T: Hashable>(like otherArray: [T], keyPath: KeyPath<Element, T>) -> [Element] {
//        let dict = otherArray.enumerated().reduce(into: [:]) { $0[$1.element] = $1.offset }
//        return sorted {
//            guard let thisIndex = dict[$0[keyPath: keyPath]] else { return false }
//            guard let otherIndex = dict[$1[keyPath: keyPath]] else { return true }
//            return thisIndex < otherIndex
//        }
//    }
}
