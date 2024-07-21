import SwiftUI

struct DebugModifier: ViewModifier {
	func body(content: Content) -> some View {
		content
			.background {
				Rectangle()
					.stroke(.red, style: .init(lineWidth: 1))
//					.frame(width: 100, height: 100)
			}
	}
}

extension View {
	@ViewBuilder func debug() -> some View {
		modifier(DebugModifier())
	}
}
