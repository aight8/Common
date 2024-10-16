import Foundation
import Accelerate

public extension Array where Element == Array<Double> {
    func allMinimum() -> Double {
        self.flatten().minimum()
    }

    func allMaximum() -> Double {
        self.flatten().maximum()
    }
    
    func allNormalizedMinMax() -> [[Element.Element]] {
        let _min = self.allMinimum()
        let _max = self.allMaximum()
        return self.map({ $0.map({ $0.interpolated(from: _min, _max, to: 0, 1) }) })
    }
}
