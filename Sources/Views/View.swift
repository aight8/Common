import SwiftUI

extension View {
	func buttonAppearance<S: PrimitiveButtonStyle>(_ s: S) -> some View {
		buttonStyle(s)
	}
}

extension View {
	//  Builtin:

	//  .offset(x: 0, y: 0)

	//  .position(x: 10, y: 10)

	//	.padding(10)
	//	.padding(.all, 10)
	//	.padding(.horizontal, 10)
	//	.padding(.vertical, 10)
	//	.padding(.top, 10)

	//	.containerRelativeFrame(.horizontal, count: 2, spacing: 2)

	//	.alignmentGuide(.leading) { dim in dim.height + dim.width }

	//	.aspectRatio(aspectRatio: 16/9, contentMode: )
	//	.clipped()

	//	Equalent to:
	//	1.	.frame(idealWidth: width, idealHeight: height)
	//	2.	.fixedSize()
	//	OR  .fixedSize(horizontal: true, vertical: true)
	@ViewBuilder func size(width: CGFloat? = nil, height: CGFloat? = nil, align: Alignment = .center) -> some View {
		self.frame(width: width, height: height, alignment: align)
	}

	@ViewBuilder func stretch(align: Alignment = .center) -> some View {
		self.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: align)
	}

	@ViewBuilder func debug(_ mark: Int = 0) -> some View {
		self.background(
			Rectangle()
				.fill(.red.quinary.opacity(0.3))
				.stroke(.red.opacity(0.3), lineWidth: 1)
		).overlay(alignment: .bottomTrailing) {
			GeometryReader { geo in
				Text("""
					 \(geo.size.width.rounded())\
					x\
					\(geo.size.height.rounded())
					""")
					.padding(.all, 1)
					.font(.caption.bold())
					.foregroundStyle(.white)
					.background(Rectangle().fill(.red))
			}
		}
	}
}


//extension View {
//	/// https://www.avanderlee.com/swiftui/conditional-view-modifier/
//	/// Applies the given transform if the given condition evaluates to `true`.
//	/// - Parameters:
//	///   - condition: The condition to evaluate.
//	///   - transform: The transform to apply to the source `View`.
//	/// - Returns: Either the original `View` or the modified `View` if the condition is `true`.
//	@ViewBuilder func `if`<Content: View>(_ condition: @autoclosure () -> Bool, transform: (Self) -> Content) -> some View {
//		if condition() {
//			transform(self)
//		} else {
//			self
//		}
//	}
//}
