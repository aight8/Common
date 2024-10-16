import Foundation

//public struct fmt {
//    var mass -> Measurement {
//        Measurement<UnitMass>.FormatStyle.measurement(
//            width: .abbreviated,
//            numberFormatStyle: .number.precision(.fractionLength(1))
//        )
//    }
//}

//FormatStyle.dateTime.format(from: Date())


//public struct PrecisionNumberFormat: FormatStyle {
//    let maxFractionLength: Int
//
//    public func format(_ value: Double) -> String {
//        value.formatted(.number.precision(.fractionLength(0...maxFractionLength)))
//    }
//}

public struct PrecisionNumberFormat: FormatStyle {
    let fractionLength: ClosedRange<Int>
    
    public func format(_ value: Double) -> String {
        value.formatted(.number.precision(.fractionLength(fractionLength)))
    }
}

public extension FormatStyle where Self == PrecisionNumberFormat {
    static func precision(_ fractionLength: Int = 1) -> PrecisionNumberFormat {
        .init(fractionLength: fractionLength...fractionLength)
    }
}

public extension FormatStyle where Self == PrecisionNumberFormat {
    static func precision(_ range: ClosedRange<Int>) -> PrecisionNumberFormat {
        .init(fractionLength: range)
    }
}

//FloatingPointFormatStyle.precision(T##maxFractionLength: Int##Int)
//FloatingPointFormatStyle.precision(T##range: ClosedRange<Int>##ClosedRange<Int>)

//PrecisionNumberFormat.precision(T##maxFractionLength: Int##Int)
//PrecisionNumberFormat.precision(T##range: ClosedRange<Int>##ClosedRange<Int>)

// TODO:
//public struct FloatingPointFormatStyle<Double> {
//    static func precision(_ fractionLength: Int = 1) -> PrecisionNumberFormat {
//        .init(fractionLength: fractionLength...fractionLength)
//    }
//
//    static func precision(_ range: ClosedRange<Int>) -> PrecisionNumberFormat {
//        .init(fractionLength: range)
//    }
//}
//    .measurement(
//        width: .abbreviated,
//        numberFormatStyle: .precision(2)
//        //                numberFormatStyle: .number.precision(.fractionLength(0...1))
//        )
