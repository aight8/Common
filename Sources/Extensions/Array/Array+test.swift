
public extension Sequence where Element: Comparable {
    
    func isAscending(strict: Bool = false) -> Bool {
        let tuples = zip(self, self.dropFirst())
        return strict ? tuples.allSatisfy(<) : tuples.allSatisfy(<=)
    }
    
    func isDescending(strict: Bool = false) -> Bool {
        let tuples = zip(self, self.dropFirst())
        return strict ? tuples.allSatisfy(>) : tuples.allSatisfy(>=)
    }
}
