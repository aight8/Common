import SwiftUI

public extension View {
	@ViewBuilder func size(_ width: CGFloat? = nil, _ height: CGFloat? = nil, align: Alignment = .center) -> some View {
		self.frame(width: width, height: height, alignment: align)
	}

	@ViewBuilder func stretch(align: Alignment = .center) -> some View {
		self.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: align)
	}
}
