import Foundation

public extension Array {
    
    subscript(_ index: Int, default defaultValue: Element) -> Element {
        return indices.contains(index) ? self[index] : defaultValue
    }
}
