//
//public extension RandomAccessCollection {
//    /// [Common]
//    func binarySearchIndex(where predicate: (Element) -> Bool) -> Index? {
//        var intervalStart = startIndex
//        var intervalEnd = endIndex
//        
//        while intervalStart != intervalEnd {
//            let intervalLength = self.distance(from: intervalStart, to: intervalEnd)
//            
//            guard intervalLength > 1 else {
//                return predicate(self[intervalStart]) ? intervalStart : nil
//            }
//            
//            let testIndex = self.index(intervalStart, offsetBy: (intervalLength - 1) / 2)
//            
//            if predicate(self[testIndex]) {
//                intervalEnd = self.index(after: testIndex)
//            }
//            else {
//                intervalStart = self.index(after: testIndex)
//            }
//        }
//        return nil
//    }
//
//    /// [Common]
//    func binarySearch(where predicate: (Element) -> Bool) -> Element? {
//        let index = self.binarySearchIndex(where: predicate)
//        if let index {
//            return self[index]
//        }
//        return nil
//    }
//}
//
////public extension Array {
////    func find<T: Strideable>(value value: T, by: KeyPath<Element, T>) -> Element? {
////        guard !isEmpty else {
////            return nil
////        }
////        return self.xSecondValues(by: {
////            return abs($0[keyPath: by].distance(to: value)) < abs($1[keyPath: by].distance(to: value))
////        })
////    }
////}
