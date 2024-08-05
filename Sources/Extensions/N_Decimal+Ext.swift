import Foundation

public extension Decimal {
	var doubleValue: Double {
		return NSDecimalNumber(decimal:self).doubleValue
	}

	func rounded(_ roundingMode: NSDecimalNumber.RoundingMode = .plain) -> Decimal {
		var result = Decimal()
		var number = self
		NSDecimalRound(&result, &number, 0, roundingMode)
		return result
	}

	var whole: Decimal {
		rounded(sign == .minus ? .up : .down)
	}

	var fraction: Decimal {
		self - whole
	}

	var fractionDigits: Int {
		let stringValue = self.description
		let components = stringValue.split(separator: ".")

		if components.count == 2 {
			return components[1].count
		} else {
			return 0
		}
	}
}
