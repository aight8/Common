import SwiftUI
import CompactSlider
import Swift

public struct Parameter: View {
	var name: String
	var min: Double
	var max: Double
	var step: Decimal
	@Binding var value: Double

	@State private var popupPresented = false
	@State private var initialValue: Double = 0

	public init(_ name: String, min: Double, max: Double, step: Decimal, value: Binding<Double>) {
		self.name = name
		self.min = min
		self.max = max
		self.step = step
		self._value = value
	}

	public var body: some View {
		HStack {
			Text(value.formatted(.precision(step.fractionDigits)))
				.fontDesign(.monospaced).bold()
				.frame(width: 80, alignment: .trailing)

			Text(name)
				.fontDesign(.monospaced)
		}
		.frame(maxWidth: .infinity, maxHeight: 30)
		.overlay(content: {
			RoundedRectangle(cornerRadius: 3)
				.strokeBorder(lineWidth: 1)
		})
		.gesture(dragGesture())
		.popover(isPresented: $popupPresented) {
			popup()
		}
	}

	@ViewBuilder func popup() -> some View {
		HStack {
			CompactSlider(
				value: $value,
				in: min...max,
				step: step.doubleValue,
				scaleVisibility: .always,
				minHeight: 60,
				enableDragGestureDelayForiOS: false
			) {
				Text(value.formatted(.precision(step.fractionDigits)))
					.bold()
				Spacer()
			}
			.frame(idealWidth: .infinity)
		}
		.padding(.all, 3)
		.presentationCompactAdaptation(.popover)
	}


	@GestureState private var dragState: CGFloat?
	func dragGesture() -> some Gesture {
		return DragGesture(minimumDistance: 0)
			.updating($dragState, body: { drag, state, trx in
				if state == nil {
					initialValue = value
				}
				state = drag.translation.width

			})
			.onChanged { drag in
				popupPresented = true
				let total = max - min
				let unit = total / 200.0
				let newValue = initialValue + (drag.translation.width * unit)
				value = Swift.max(min, Swift.min(max, newValue))
			}
			.onEnded { drag in
				popupPresented = false
			}
	}
}

// min: Int
// max: Int
// step: Int

//public struct Parameter: View {
//	var name: String
//	@Binding var value: Int {
//		didSet {
//			valueDouble = Double(value)
//		}
//	}
//	@State var valueDouble: Double = 0.0
//	var range: ClosedRange<Int>
//
//	@State private var showPopover = false
//	@GestureState private var dragState: CGFloat?
//	@State private var initialValue: Int = 0
//
//	public init(_ name: String, value: Binding<Int>, in range: ClosedRange<Int>) {
//		self.name = name
//		self._value = value
//		self.range = range
//	}
//
//	public var body: some View {
//		HStack {
//			Text(value.formatted(.number.precision(.fractionLength(2))))
//				.fontDesign(.monospaced).bold()
//				.frame(width: 60, alignment: .trailing)
//			Text(name)
//				.fontDesign(.monospaced)
//		}
//		.frame(maxWidth: .infinity, maxHeight: 30)
//		.overlay(content: {
//			RoundedRectangle(cornerRadius: 3)
//				.strokeBorder(lineWidth: 1)
//		})
//		.gesture(DragGesture(minimumDistance: 0)
//			.updating($dragState, body: { drag, state, trx in
//				if state == nil {
//					initialValue = value
//				}
//				state = drag.translation.width
//
//			})
//			.onChanged { drag in
//				showPopover = true
//				let total = range.upperBound - range.lowerBound
//				let unit = Double(total) / 200.0
//				let newValue = initialValue + Int(drag.translation.width * unit)
//				value = max(range.lowerBound, min(range.upperBound, Int(newValue)))
//			}
//			.onEnded { drag in
//				showPopover = false
//			}
//		)
//		.popover(isPresented: $showPopover) {
//			HStack {
//				CompactSlider(
//					value: $valueDouble,
//					in: Double(range.lowerBound)...Double(range.upperBound),
//					step: 1,
//					scaleVisibility: .always,
//					minHeight: 70,
//					enableDragGestureDelayForiOS: false
//				) {
//					Text("\(value, specifier: "%.1f")")
//					Spacer()
//				}
//				.frame(idealWidth: .infinity)
//			}
//			.padding(.all, 3)
//			.presentationCompactAdaptation(.popover)
//		}
//	}
//}

public struct ParameterSlider: View {
	var name: String
	@Binding var value: Double
	var range: ClosedRange<Double>

	@State private var showPopover = false
	@GestureState private var dragState: CGFloat?
	@State private var initialValue: Double = 0.0

	public init(_ name: String, value: Binding<Double>, in range: ClosedRange<Double>) {
		self.name = name
		self._value = value
		self.range = range
	}

	public var body: some View {
		let dragGesture = DragGesture(minimumDistance: 0)
			.updating($dragState, body: { drag, state, trx in
				if state == nil {
					initialValue = value
				}
				state = drag.translation.width
			})
			.onChanged { drag in
				showPopover = true
				let total = range.upperBound - range.lowerBound
				let unit = total / 200.0
				let newValue = initialValue + (drag.translation.width * unit)
				value = max(range.lowerBound, min(range.upperBound, newValue))
			}
			.onEnded { drag in
				showPopover = false
			}

		HStack {
			Text(value.formatted(.number.precision(.fractionLength(2))))
				.fontDesign(.monospaced).bold()
				.frame(width: 60, alignment: .trailing)
			Text(name)
				.fontDesign(.monospaced)
		}
		.frame(maxWidth: .infinity, maxHeight: 30)
		.overlay(content: {
			RoundedRectangle(cornerRadius: 3)
				.strokeBorder(lineWidth: 1)
		})
		.gesture(dragGesture)
		.popover(isPresented: $showPopover) {
			HStack {
				CompactSlider(
					value: $value,
					in: range,
					scaleVisibility: .always,
					minHeight: 70,
					enableDragGestureDelayForiOS: false
				) {
					Text(value.formatted(.precision(1)))
					Spacer()
				}
				.frame(idealWidth: .infinity)
			}
			.padding(.all, 3)
			.presentationCompactAdaptation(.popover)
		}
	}
}

#Preview(
	"toggle",
	traits: .defaultLayout
) {
	@Previewable @State var value = 53.4
	ParameterSlider("example", value: $value, in: -100...100)
		.padding()
}
