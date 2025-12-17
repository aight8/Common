import Accelerate

public extension Array where Element == Double {
    /// [Common] **[vDSP]** Returns the elements of `vector` clipped to the specified range.
    func clamped(to: ClosedRange<Double>) -> [Double] {
        vDSP.clip(self, to: to)
    }

    /// [Common] **[vDSP]** Returns the elements of `vector` inverted-clipped to the specified range.
    func invertedClamp(to: ClosedRange<Double>) -> [Double] {
        vDSP.invertedClip(self, to: to)
    }

    /// TODO:
    /// [Common] **[vDSP]** Returns the elements of `vector` after applying a specified thresholding rule.
//    func threshold(to: Double, with: vDSP.ThresholdRule<Double>) -> [Double] {
//        vDSP.threshold(self, to: to, with: with)
//    }
}
