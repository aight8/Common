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

    /// [Common]
    init(_ value: UUID) {
        self.init(value.description)
    }

    /// [Common] TEST
    init(_ value: any Formatted) {
        self.init(value.formatted())
    }

    func nowrap() -> Self {
        self.lineLimit(1)
        // self.minimumScaleFactor(0.5)
        return self
    }
}

public protocol Formatted {
    func formatted() -> String
}
