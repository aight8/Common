import SwiftUI

public extension Text {
	init(_ value: any Numeric) {
		self.init(String(describing: value))
	}

	init(_ value: Date) {
		self.init(value.formatted())
	}

	init(_ value: Range<Date>) {
		self.init(value.formatted())
	}
}
