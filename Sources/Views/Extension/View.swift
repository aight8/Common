import SwiftUI

public extension View {
    /// [Common]
	@ViewBuilder func size(_ width: CGFloat? = nil, _ height: CGFloat? = nil, align: Alignment = .center) -> some View {
		self.frame(width: width, height: height, alignment: align)
	}

    /// [Common]
	@ViewBuilder func stretch(align: Alignment = .center) -> some View {
		self.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: align)
	}
}
