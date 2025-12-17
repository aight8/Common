//import Foundation
//
//
///// - Remark: TODO.. rename to **proportions(of total: Double)**?
//extension Array where Element == Double {
//    /// [Common] Distributes a total value according to the proportions in the array.
//    /// Ensures that there are no remaining amounts by adjusting the values.
//    func distributed(total: Double) -> [Double] {
//        // Calculate raw values based on proportions
//        let rawValues = self.map { $0 * total }
//        
//        // Calculate the rounded values and the leftover difference
//        var roundedValues = rawValues.map { round($0) }
//        let roundedTotal = roundedValues.reduce(0, +)
//        var difference = total - roundedTotal
//        
//        // Adjust values if there's a difference
//        if difference != 0 {
//            // Sort the indexes by the largest fractional part to minimize error adjustment
//            let fractionalParts = rawValues.enumerated().map { index, value in
//                return (index, value - roundedValues[index])
//            }.sorted { abs($0.1) > abs($1.1) }
//            
//            // Adjust the values by the difference
//            for (index, _) in fractionalParts {
//                roundedValues[index] += difference > 0 ? 1 : -1
//                difference += difference > 0 ? -1 : 1
//                
//                // Break if the difference has been fully adjusted
//                if difference == 0 {
//                    break
//                }
//            }
//        }
//        
//        return roundedValues
//    }
//}
