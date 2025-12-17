import Algorithms

public extension Array where Element: Equatable {
    
    /// [Common] Same as chunked method in swift-algorithms but the elements in the current groups are given as parameters of the closure.
    /// The closure should return **true** if the **next** Element belongs to the **group** of the **previous** element.
    /// Otherwise it starts a new group.
    func chunked(by fn: (_ next: Element, _ prev: Element, _ group: [Element]) -> Bool) -> [[Element]] {
        if self.count == 0 {
            return []
        }
        if self.count == 1 {
            return [self]
        }
        
        var groups: [[Element]] = [[self.first!]]
        
        for (idx, next) in self.enumerated() {
            if idx == self.startIndex {
                continue
            }
            
            let prev = self[idx - 1]
            let lastGroup = groups.last
            let currentGroup: [Element] = (lastGroup != nil && lastGroup!.contains(prev)) ? groups.last! : []
            
            if fn(next, prev, currentGroup) {
                groups[groups.lastIndex].append(next)
            } else {
                groups.append([next])
            }
        }
        return groups
    }
}

public extension Collection {
    
    @inlinable
    func chunked(
        by belongInSameGroup: (Element, Element, SubSequence) throws -> Bool
    ) rethrows -> [SubSequence] {
        guard !isEmpty else { return [] }
        var result: [SubSequence] = []
        
        var start = startIndex
        var current = self[start]
        
        for (index, element) in indexed().dropFirst() {
            if try !belongInSameGroup(current, element, self[start..<index]) {
                result.append(self[start..<index])
                start = index
            }
            current = element
        }
        
        if start != endIndex {
            result.append(self[start...])
        }
        
        return result
    }
}
