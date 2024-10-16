import Accelerate

public extension Array where Element == Double {
    /// [Common] **[vDSP]** FIR filtering with decimation and antialiasing.
    func downsample(decimationFactor: Int, filter: [Double]) -> [Double] {
        vDSP.downsample(self, decimationFactor: decimationFactor, filter: filter)
    }
}
