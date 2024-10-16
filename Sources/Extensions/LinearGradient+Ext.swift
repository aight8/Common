import SwiftUI

public extension LinearGradient {
    /// [Common]
    init(
        values: [Double],
        minValue: Double,
        maxValue: Double,
        minColor: Color,
        maxColor: Color
    ) {
        var stops: [Gradient.Stop] = []
        
        for (nr, progress) in stride(from: 0, to: 1, by: 1 / Double(values.count)).enumerated() {
            let fraction = values[nr].interpolated(from: minValue, maxValue, to: 0, 1, clamp: true)
            
            stops.append(.init(
                color: maxColor.mix(with: minColor, by: 1 - fraction),
                location: progress
            ))
        }

        self.init(
            stops: stops,
            startPoint: .leading,
            endPoint: .trailing
        )
    }
}
