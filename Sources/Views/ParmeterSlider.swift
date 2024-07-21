import SwiftUI
import CompactSlider

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
		.gesture(DragGesture(minimumDistance: 0)
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
		)
		.popover(isPresented: $showPopover) {
			HStack {
				CompactSlider(
					value: $value,
					in: range,
					direction: .center,
					handleVisibility: .always(width: 1),
					scaleVisibility: .always,
					minHeight: 70,
					enableDragGestureDelayForiOS: false
				) {
					Text("\(value, specifier: "%.1f")")
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
