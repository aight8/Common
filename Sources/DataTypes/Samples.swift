import Foundation
import Accelerate
import Algorithms
import SwiftUI
import Charts
import TabularData

//public struct IrregularSamples {
//    var samples: [Sample]
//}

//public struct RegularSamples {
//    var startAt: Date
//    var interval: TimeInterval
//    var samples: [Double]
//}
//
//public struct RegularSamples {
//    var startAt: Date
//    var interval: TimeInterval
//    var samples: [Double]
//    
//    //    public generate()
//}

// TODO: rename -> AXSamplesFactory (AX is package prefix)
public struct SamplesFactory<SourceObject: Datable> {
    let source: [SourceObject]
    let yvals: [Date]
    
    public init(source: [SourceObject]) {
        self.source = source
        self.yvals = source.map(\.datetime)
    }

    public func samples(by: (_ obj: SourceObject) -> Double) -> Samples {
        let values = self.source.map { obj in
            by(obj)
        }
        return Samples(yvals, values)
    }
}

public struct MultiSamples {
    public let inputs: [Samples]
    public let outputs: [[Double]]

    public init(inputs: [Samples] = []) {
        precondition(inputs.count >= 2, "At least 2 sample vectors are required.")
        self.inputs = []

        let adsf = inputs.map(\.xVals).flatten()

        let allMinDate = inputs.map(\.xVals).allMinimum()
        let allMaxDate = inputs.map(\.xVals).allMaximum()
        let allMinValue = inputs.map(\.yVals).allMinimum()
        let allMaxValue = inputs.map(\.yVals).allMaximum()

        var _outputs: [[Double]] = []
        for vector in inputs {
            let output = vector.yVals.normalizedMinMax(to: allMinValue...allMaxValue)
            _outputs.append(output)
        }

        self.outputs = _outputs
    }
}

/// Holds the inputed raw samples and a processed representation appied resampling and smoothing on it.
public struct SamplesInOut {
    public let input: Samples
    public let output: Samples

    public init(
        input: Samples,
        targetCount: Int,
        method: SmoothingMethod
    ) {
        self.input = input
        self.output = input
            .resampled(targetCount: targetCount)
            .smoothened(method)
    }
}

/// [Common]
/// TODO: IrregularSample
public struct Sample/*: SampleProtocol*/ {
    public let x: Double /// # X / Time / Abszisse / Horizonal
    public let y: Double /// # Y / Value / Ordinate / Vertical

    init(_ x: Double, _ y: Double) {
        self.x = x
        self.y = y
    }
}

extension Sample: Identifiable {
    public var id: Double { x }
}

extension Sample: Datable {
    public var datetime: Date { Date(x) }
}

extension Sample: Comparable {
    public static func < (lhs: Sample, rhs: Sample) -> Bool {
        lhs.x < rhs.x
    }
}

public typealias Samples = [Sample]
public extension Samples {
    ///
    /// # Initializers
    ///

    init() {
        self = []
    }
    
    init(_ samples: [Sample]) {
        self = samples
    }
    
    init(_ xVals: [Double], _ yVals: [Double]) {
        precondition(xVals.count == yVals.count, "xVals [\(xVals.count)] and yVals [\(yVals.count)] must have the same count")
        self = zip(xVals, yVals).map { Sample($0, $1) }
        sort()
    }

    init(_ xVals: [Date], _ yVals: [Double]) {
        precondition(xVals.count == yVals.count, "xVals [\(xVals.count)] and yVals [\(yVals.count)] must have the same count")
        self = zip(xVals, yVals).map { Sample($0.double, $1) }
        sort()
    }

    init(_ value: [(x: Double, y: Double)]) {
        self = value.map { Sample($0, $1) }
        sort()
    }

    ///
    /// # X values
    ///

    var xVals: [Double] {
        self.map(\.x)
    }

    var xDates: [Date] {
        self.map(\.datetime)
    }

    ///
    /// # Y values
    ///
    
    var yVals: [Double] {
        self.map(\.y)
    }
    
    ///
    /// # Samples Representation Alternatives
    ///
    
    var tuples: [(Double, Double)] {
        return self.map { ($0.x, $0.y) }
    }
    
    
    var tuplesUsingDate: [(Date, Double)] {
        return self.map { ($0.datetime, $0.y) }
    }
    
    ///
    /// # Min, Max
    ///

    var minDate: Date {
        guard let first = first else {
            fatalError()
        }
        return first.datetime
    }
    
    var maxDate: Date {
        guard let last = last else {
            fatalError()
        }
        return last.datetime
    }

    var minValue: Double {
        self.yVals.minimum()
    }

    var maxValue: Double {
        self.yVals.maximum()
    }

    ///
    /// # Resample
    ///
    
    func resampled(targetCount: Int, method: ResampleMethod = .lerp) -> Samples {
        switch method {
        case .lerp:
            let rs = AccelLerpResamplerD(xVals, targetCount: targetCount)!
            return Samples(rs.targetVals, rs.resample(yVals))
        case .lerpAccel:
            let rs = LerpResampler(xVals, targetCount: targetCount)!
            return Samples(rs.targetVals, rs.resample(yVals))
        }
    }
    
    ///
    /// # Smoothing
    ///
    
    func smoothened(_ method: SmoothingMethod) -> Samples {
        return withY(values: method.smoothen(yVals))
    }
    
    ///
    /// # Misc
    ///

    func createChangeSamples() -> Samples {
        self.withY({ oldValues in
            oldValues.distancesRelativeToPrevious()
        })
    }

    ///
    /// # Builder Helper
    ///
    
    func withY(values: [Double]) -> Samples {
        Samples(self.xVals, values)
    }

    func withY(_ fn: (_ samples: [(Date, Double)]) -> [Double]) -> Samples {
        Samples(self.xVals, fn(self.tuplesUsingDate))
    }
    
    func withY(_ fn: (_ oldValues: [Double]) -> [Double]) -> Samples {
        Samples(self.xVals, fn(self.yVals))
    }
}

///
/// # Samples - Swift Chart
///

public extension Samples {
    @ChartContentBuilder
    func chartPoints() -> some ChartContent {
        ForEach(self) { sample in
            PointMark(
                x: .value("datetime", sample.datetime),
                y: .value("value", sample.y)
            )
        }
    }
    
    @ChartContentBuilder
    func chartLine(
        series: String
    ) -> some ChartContent {
        ForEach(self) { sample in
            LineMark(
                x: .value("datetime", sample.datetime),
                y: .value("value", sample.y),
                series: .value("name", series)
            )
        }
    }

    @ChartContentBuilder
    func chartArea(
        series: String,
        stacking: MarkStackingMethod = .standard
    ) -> some ChartContent {
        ForEach(self) { sample in
            AreaMark(
                x: .value("datetime", sample.datetime),
                y: .value("value", sample.y),
                series: .value("name", series),
                stacking: stacking
            )
        }
    }
}

///
/// # Samples - Annotated Chart Line
///

public extension Samples {
    public struct Annotation<Content: View> {
        public let datetime: Date
        public let content: () -> Content

        public init(datetime: Date, content: @escaping () -> Content) {
            self.datetime = datetime
            self.content = content
        }
    }

    @ChartContentBuilder
    func chartLine(
        series: String,
        annotations: [Annotation<AnyView>]
    ) -> some ChartContent {
        ForEach(self) { sample in
            LineMark(
                x: .value("datetime", sample.datetime),
                y: .value("value", sample.y),
                series: .value("name", series)
            )
            .annotation {
                let anno = annotations.first { anno in
                    anno.datetime == sample.datetime
                }
                AnyView(anno?.content())
            }
        }
    }
}

///
/// # Debug
///

public extension Samples {
    public func debug() {
        var dataframe = DataFrame()

        dataframe.append(
            column: Column(
                name: "X (Horizontal)",
                contents: self.map({
                    $0.datetime.formatted(
                        .dateTime
                            .day(.twoDigits)
                            .month(.abbreviated)
                            .year(.padded(4))
                            .hour(.twoDigits(amPM: .omitted))
                            .minute(.twoDigits)
                            .second(.twoDigits)
                        )
                    })
            )
        )
        dataframe.append(
            column: Column(
                name: "δ to PREV",
                contents: self.xDates.distancesRelativeToPrevious().map({ value in
                    Duration(value)
                        .formatted(.units(
                            allowed: [.weeks, .days, .hours, .minutes, .seconds],
                            maximumUnitCount: 2,
                            fractionalPart: .show(length: 2)
                        ))
                        .prefixing {
                            value.isPositive ? "+ " : ""
                        }
                })
            )
        )
        dataframe.append(
            column: Column(
                name: "δ to 1.",
                contents: self.xDates.distancesRelativeToFirst().map({
                    Duration($0).formatted(
                        .units(
                            allowed: [.weeks, .days, .hours, .minutes, .seconds],
                            maximumUnitCount: 2,
                            fractionalPart: .show(length: 2)
                        )
                    )
                })
            )
        )
        dataframe.append(
            column: Column(
                name: "Y (Vertical)",
                contents: self.map({
                    $0.y
                }
            ))
        )

        print("Samples :: Table")
        print(dataframe.description)
    }
}

/// [Common]
public enum ResampleMethod: CaseIterable {
	case lerp, lerpAccel
}

///
/// # Smoothing Method
///

/// [Common]
public protocol SmoothingMethod {
	func smoothen(_ values: [Double]) -> [Double]
}

///
/// ### Moving Average
///

/// [Common]
public struct MovingAverage: SmoothingMethod {
	var windowSize: Int
	var accel: Bool

    public func smoothen(_ values: [Double]) -> [Double] {
		if accel {
            return values.movingAverageAccel(windowSize: windowSize)
		} else {
			return values.movingAverage(windowSize: windowSize)
		}
	}
}

/// [Common]
public extension SmoothingMethod where Self == MovingAverage {
	static func movingAverage(windowSize: Int, accel: Bool = true) -> any SmoothingMethod {
		MovingAverage(windowSize: windowSize, accel: accel)
	}
}

///
/// ### Exponential Moving Average
///

/// [Common]
public struct ExponentialMovingAverage: SmoothingMethod {
	var period: Int
    
    public func smoothen(_ values: [Double]) -> [Double] {
		values.exponentialMovingAverage(period: period)
	}
}

/// [Common]
public extension SmoothingMethod where Self == MovingAverage {
	static func exponentialMovingAverage(period: Int) -> any SmoothingMethod {
		ExponentialMovingAverage(period: period)
	}
}

///
/// ### Convolve
///

/// [Common]
public struct Convolve: SmoothingMethod {
	var kernel: [Double]
	var accel: Bool

    public func smoothen(_ values: [Double]) -> [Double] {
//		if accel {
//            values.convolveAccel(with: kernel)
//		} else {
            values.convolve(with: kernel)
//		}
	}
}

/// [Common]
public extension SmoothingMethod where Self == MovingAverage {
	static func convole(kernel: [Double], accel: Bool = true) -> any SmoothingMethod {
		Convolve(kernel: kernel, accel: accel)
	}

	static func convoleGaussian(size: Int, sigma: Double, accel: Bool = true) -> any SmoothingMethod {
		var _size = size
		if _size % 2 == 0 {
			_size = _size + 1
		}

		let center = Double(_size - 1) / 2.0

		let kernel = (0..<_size).map { i in
			let x = Double(i) - center
			return exp(-0.5 * (pow(x, 2)) / pow(sigma, 2))
		}

        return Convolve(
            kernel: kernel.normalizedL1(),
            accel: accel
        )
	}
}
