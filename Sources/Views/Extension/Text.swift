import SwiftUI

public extension Text {
    /// [Common]
	init(_ value: any Numeric) {
		self.init(String(describing: value))
	}

    /// [Common]
	init(_ value: Date) {
		self.init(value.formatted())
	}

    /// [Common]
	init(_ value: Range<Date>) {
		self.init(value.formatted())
	}
}
