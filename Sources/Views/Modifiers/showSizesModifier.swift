// Author: SwiftUI-Lab (swiftui-lab.com)
// Description: Implementation of the showSizes() debugging modifier
// blog article: https://swiftui-lab.com/layout-protocol-part-2

import SwiftUI

public extension View {
	@ViewBuilder func showSizes(_ proposals: [MeasureLayout.SizeRequest] = [.minimum, .ideal, .maximum, .current]) -> some View {
		Measure(proposals: proposals) { self }
	}
}

struct MeasureExample: View {
	var body: some View {

		VStack {
			HStack {
				ScrollView {
					Text("Hello world!")
				}
				.showSizes([.current, .maximum])

				Rectangle()
					.fill(.yellow)
					.showSizes()

				Text("Hello world")
					.showSizes()

				Image("clouds")
					.showSizes()

				Image("clouds")
					.resizable()
					.aspectRatio(contentMode: .fit)
					.showSizes([.minimum, .ideal, .maximum, .current])


			}
			.padding(60)
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(.white)

	}
}

struct Measure<V: View>: View {
	@State private var reportedSizes: [CGSize] = []

	let proposals: [MeasureLayout.SizeRequest]
	@ViewBuilder let content: () -> V
    
    @State var dashPhase: Double = 0.0

	var body: some View {
		MeasureLayout {
			content()
				.layoutValue(key: MeasureLayout.InfoRequest.self, value: proposals)
				.layoutValue(key: MeasureLayout.InfoReply.self, value: $reportedSizes)
				.overlay(alignment: .topTrailing) {
					Text(mergedSizes)
						.background(.gray)
						.foregroundColor(.white)
						.font(.caption)
						.offset(y: -20)
						.fixedSize()
				}
				.overlay {
					Rectangle()
						.stroke(
                            .gray,
                            style: .init(
                                lineWidth: 1,
                                lineCap: .butt,
                                lineJoin: .bevel,
                                miterLimit: .greatestFiniteMagnitude,
                                dash: [3,3],
                                dashPhase: dashPhase
                            )
                        )
                        .animation(.linear(duration: .seconds(2)).repeatForever(autoreverses: false), value: dashPhase)
                        .onAppear {
                            dashPhase = 60
                        }
//                        .gesture(TapGesture(count: 1).onEnded({ value in
//                        }))
                        .gesture(DragGesture().onChanged({ value in
                        }))
                        .onTapGesture(count: 1, coordinateSpace: .local) { pt in
                            print(pt.x, pt.y)
                        }
				}
		}
	}

	var mergedSizes: String {
		String(reportedSizes.map { String(format: "(%.0f, %.0f)" , $0.width, $0.height) }.joined(separator: " - "))
	}
}

public struct MeasureLayout: Layout {
	public func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
		return subviews[0].sizeThatFits(proposal)
	}

	public func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
		DispatchQueue.main.async {
			subviews[0][InfoReply.self]?.wrappedValue = subviews[0][InfoRequest.self].map {
				$0.size(view: subviews[0], proposal: proposal)
			}
		}

		subviews[0].place(at: CGPoint(x: bounds.midX, y: bounds.midY), anchor: .center, proposal: proposal)
	}

	actor InfoRequest: LayoutValueKey {
		static var defaultValue: [SizeRequest] = []
	}

	actor InfoReply: LayoutValueKey {
		static var defaultValue: Binding<[CGSize]>? = nil
	}

	public enum SizeRequest {
		case minimum
		case ideal
		case maximum
		case current
		case proposal(size: ProposedViewSize)

		func size(view: LayoutSubview, proposal: ProposedViewSize) -> CGSize {
			switch self {
				case .minimum: return view.sizeThatFits(.zero)
				case .ideal: return view.sizeThatFits(.unspecified)
				case .maximum: return view.sizeThatFits(.infinity)
				case .current: return view.sizeThatFits(proposal)
				case .proposal(let prop): return view.sizeThatFits(prop)
			}
		}
	}
}
