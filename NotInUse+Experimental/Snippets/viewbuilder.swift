import SwiftUI

struct ConditionalView<Content: View>: View {
    let condition: Bool
    let content: () -> Content
    
    init(condition: Bool, @ViewBuilder content: @escaping () -> Content) {
        self.condition = condition
        self.content = content
    }
    
    var body: some View {
        if condition {
            content()
        } else {
            EmptyView()
        }
    }
}
