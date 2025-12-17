

public extension Array where Element: Collection {
    
    func flatten() -> [Element.Element] {
        return self.flatMap { $0 }
    }
}
