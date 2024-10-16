import SwiftUI

public extension Array where Element == Color.Resolved {
    // percentage should be between 0 and 1
    func intermediate(percentage: Float) -> Color.Resolved {
        let percentage = Swift.max(Swift.min(percentage, 1), 0)
        switch percentage {
        case 0: return first ?? Color.Resolved(red: 0, green: 0, blue: 0, opacity: 0)
        case 1: return last ?? Color.Resolved(red: 0, green: 0, blue: 0, opacity: 0)
        default:
            let approxIndex = percentage / (1 / Float(count - 1))
            let firstIndex = Int(approxIndex.rounded(.down))
            let secondIndex = Int(approxIndex.rounded(.up))
            
            let firstColor = self[firstIndex]
            let secondColor = self[secondIndex]
            
            var (r1, g1, b1, a1): (Float, Float, Float, Float) = (
                firstColor.red, firstColor.green, firstColor.blue, firstColor.opacity
            )
            var (r2, g2, b2, a2): (Float, Float, Float, Float) = (
                secondColor.red, secondColor.green, secondColor.blue, secondColor.opacity
            )
            
            let intermediatePercentage = approxIndex - Float(firstIndex)
            return Color.Resolved(
                red: (r1 + (r2 - r1) * intermediatePercentage),
                green: (g1 + (g2 - g1) * intermediatePercentage),
                blue: (b1 + (b2 - b1) * intermediatePercentage),
                opacity: (a1 + (a2 - a1) * intermediatePercentage)
            )
        }
    }
}
