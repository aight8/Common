import SwiftUI

//fileprivate func test() {
//	Formatter.string()

//	FloatingPointFormatStyle.Attributed
//	FloatingPointFormatStyle.Currency
//	FloatingPointFormatStyle.
//	MeasurementFormatter.string()
//	MeasurementFormatter.editingString()
//	IntegerFormatStyle.stopwatch(startingAt: )
//	NumberFormatter.string()
//	Decimal.FormatStyle.currency(code: "CHF")
//	Decimal.FormatStyle.measurement(width: .abbreviated, hidesScaleName: true, numberFormatStyle: .number, usage: .asProvided)
//	Date.FormatStyle(date: , time: , locale: , calendar: , timeZone: , capitalizationContext: )

//	Float().formatted()
//	Decimal().formatted()
//	Int().formatted()
//	Set<String>().formatted()
//	Array<String>().formatted()
//	Date().formatted()
//	TimeInterval.formatted()
//	/// NOT
//	Dictionary<String, String>().formatted()
//	OptionSet().formatted()
//}

/// Foundation provides format styles for
/// integers (IntegerFormatStyle),
/// floating-point numbers (FloatingPointFormatStyle),
/// decimals (Decimal.FormatStyle),
/// measurements (Measurement.FormatStyle),
/// arrays (ListFormatStyle), and more.
/// The “Conforming types” section below shows all the format styles available
/// from Foundation and any system frameworks that implement the FormatStyle protocol.
/// The numeric format styles also provide supporting format styles to
/// format currency and percent values, like
/// IntegerFormatStyle.Currency and
/// Decimal.FormatStyle.Percent.

//struct ShortNumberFormat: FormatStyle {
//	let maxFractionLength: Int
//	func format(_ value: Double) -> String {
//		value.formatted(.number.precision(.fractionLength(0...maxFractionLength)))
//	}
//}
//
//extension FormatStyle where Self == ShortNumberFormat {
//	static func short(maxFractionLength: Int = 1) -> ShortNumberFormat {
//		.init(maxFractionLength: maxFractionLength)
//	}
//}
