import Foundation

//struct RelativeRoundedGroupBoxStyle: GroupBoxStyle {
//	@Environment(\.relativeRoundedGroupBoxStyleNestingLevel)
//	var nestingLevel
//
//	func makeBody(configuration: Configuration) -> some View {
//		VStack {
//			configuration.label
//				.font(.subheadline.bold())
//			configuration.content
//		}
//		.padding(8)
//		.background(Color(white: nestingLevel % 2 == 0 ? 0.2 : 0.1), in: RoundedRectangle(cornerRadius: max(0, 24 - CGFloat(nestingLevel) * 8), style: .continuous))
//		.transformEnvironment(\.relativeRoundedGroupBoxStyleNestingLevel) { nestingLevel in
//			nestingLevel += 1
//		}
//		.groupBoxStyle(self)
//	}
//}
