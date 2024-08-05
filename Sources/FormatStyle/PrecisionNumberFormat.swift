import Foundation

public struct PrecisionNumberFormat: FormatStyle {
	let maxFractionLength: Int

	public func format(_ value: Double) -> String {
		value.formatted(.number.precision(.fractionLength(0...maxFractionLength)))
	}
}

public extension FormatStyle where Self == PrecisionNumberFormat {
	static func precision(_ maxFractionLength: Int = 1) -> PrecisionNumberFormat {
		.init(maxFractionLength: maxFractionLength)
	}
}
