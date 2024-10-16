import SwiftUI

public extension ForEach where Data.Element: Hashable, ID == Data.Element, Content: View {
    /// [Common]
    init(values: Data, content: @escaping (Data.Element) -> Content) {
        self.init(values, id: \.self, content: content)
    }
}

//public extension ForEach where Data: RandomAccessCollection, Content: View {
//    init(values: Data, content: @escaping (Data.Element, Data.Index) -> Content) {
//        self.init(values.enumerated(), id: \.offset, content: content)
//    }
//}
