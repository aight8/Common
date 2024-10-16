import SwiftUI

public extension StrokeStyle {
    static func solid(_ lineWidth: Double) -> StrokeStyle {
        .init(lineWidth: lineWidth)
    }
    static func dashed(_ lineWidth: Double, dash: [CGFloat]) -> StrokeStyle {
        .init(lineWidth: lineWidth, dash: dash)
    }
    static func dotted(_ lineWidth: Double) -> StrokeStyle {
        .init(lineWidth: lineWidth, dash: [lineWidth, lineWidth])
    }
}
