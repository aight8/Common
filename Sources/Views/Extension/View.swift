import SwiftUI

public extension View {
    /// [Common]
	@ViewBuilder
    func size(_ width: CGFloat? = nil, _ height: CGFloat? = nil, align: Alignment = .center) -> some View {
		self.frame(width: width, height: height, alignment: align)
	}

    /// [Common]
    @ViewBuilder
    func stretch(align: Alignment = .center) -> some View {
        self.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: align)
    }
}

public extension View {
    // @ViewBuilder func sizing(_ attr: SizingAttribute...) -> some View {

    /// [Common]
    @ViewBuilder func wrap(_ attr: SizingAttribute...) -> some View {
        return self
    }
}

public enum SizingAttribute {
    case growX
    case growY
    case minX(Int)
    case minY(Int)
    case align(Alignment)
}

public extension View {
    /// [Common]
    // @ViewBuilder func background(_ attr: SizingAttribute...) -> some View {
    //     return self
    //         .back
    // }
}
