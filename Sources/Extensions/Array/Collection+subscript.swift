
extension Collection where Indices.Iterator.Element == Index {
    
    subscript (optional index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
