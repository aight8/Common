import Accelerate

typealias Doubles = [Double]

public extension Array where Element == Double {
    /// [Common] **[vDSP]** Returns an array containing monotonically incrementing values within a specified range.
    static func ramp(in: ClosedRange<Double>, count: Int) -> [Double] {
        Doubles(vDSP.ramp(in: `in`, count: count))
    }

    /// [Common] **[vDSP]** Returns an array containing monotonically incrementing values within a specified range.
//    init(in: ClosedRange<Double>, count: Int) {
//        self.init(vDSP.ramp(in: `in`, count: count))
//    }

    /// [Common] **[vDSP]** Returns an array containing monotonically incrementing or decrementing values within a specified range.
    init(from: Double, through: Double, count: Int) {
        self.init(vDSP.ramp(from: from, through: through, count: count))
    }

    /// [Common] **[vDSP]** Returns an array containing monotonically incrementing or decrementing values.
    init(withInitialValue: Double, increment: Double, count: Int) {
        self.init(vDSP.ramp(withInitialValue: withInitialValue, increment: increment, count: count))
    }

    /// [Common] **[vDSP]** Creates an array containing the specified window.
    init(windowSequence: vDSP.WindowSequence, count: Int, isHalfWindow: Bool) {
        self.init(
            vDSP.window(ofType: Double.self, usingSequence: windowSequence, count: count, isHalfWindow: isHalfWindow)
        )
    }

    /// [Common] Generate signal samples of a sine wave
    init(count: Int, amplitude: Double, frequency: Double, phase: Double = 0.0) {
        let arr: [Double] = (0..<count).map { sampleIndex in
            let time = Double(sampleIndex) / 1000
            return amplitude * Foundation.sin(2.0 * .pi * amplitude * frequency * time + phase)
        }
        self.init(arr)
    }
}
