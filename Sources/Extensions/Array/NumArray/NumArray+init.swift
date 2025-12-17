import Accelerate

public typealias Doubles = [Double]

public extension Array where Element == Double {
    /// [Common] **[vDSP]** Returns an array containing monotonically incrementing values within a specified range.
    static func ramp(in: ClosedRange<Double>, count: Int) -> [Double] {
        Doubles(vDSP.ramp(in: `in`, count: count))
    }

    // TODO: TEST
    static func ramp(from: Double, count: Int, step: Double) -> [Double] {
        Doubles(vDSP.ramp(withInitialValue: from, increment: step, count: count))
    }

    // TODO: TEST
    // Equalent to:
    //      stride(from: 0, through: 10, by: 1)
    //      (0...3).striding(by: 1)
    static func ramp(from: Double, through: Double, count: Int) -> [Double] {
        Doubles(vDSP.ramp(from: from, through: through, count: count))
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

//    for (key, value) in Doubles(arraySize: 50, waves: 1, amplitude: 100).enumerated() {
//        print(key, value)
//    }
    /// [Common] Generate signal samples of a sine wave
    init(arraySize: Int, waves: Int, amplitude: Double) {
        // Create an array to store the signal values
//        var signal = [Double]()
        self.init()
        self.reserveCapacity(arraySize)
        
        // Calculate the frequency (how often the wave repeats over the sample range)
        let frequency = Double(waves) / Double(arraySize)
        
        // Generate the signal using a sine wave formula
        for i in 0..<arraySize {
            // The x value for this sample point (scaled over the wave's period)
            let x = Double(i) * frequency * 2.0 * .pi
            // Calculate the sine wave value, scaled by amplitude
            let value = amplitude * sin(x)
            self.append(value)
        }
        
//        return signal
    }
    
    /// [Common] Generate signal samples of a sine wave
//    init(count: Int, amplitude: Double, frequency: Double, phase: Double = 0.0) {
//        let arr: [Double] = (0..<count).map { sampleIndex in
//            let time = Double(sampleIndex) / 1000
//            return amplitude * Foundation.sin(2.0 * .pi * amplitude * frequency * time + phase)
//        }
//        self.init(arr)
//    }
}
