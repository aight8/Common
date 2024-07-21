import SwiftUI

extension Text {
	init(_ value: Int) {
		self.init(String(value))
	}

//	init<T>(_ value: T) where T: BinaryInteger {
//		self.init(String(describing: value))
//	}

	init(_ value: any BinaryInteger) {
//		String(format: T##String, arguments: T##[any CVarArg])
		self.init(String(describing: value))
	}

	init(_ value: any BinaryFloatingPoint) {
		self.init(String(describing: value))
	}

//	init(_ value: any String) {
//		self.init(String(describing: value))
//	}

//	init(_ value: Double) {
//		self.init(String(value))
//	}
//
//	init(_ value: Bool) {
//		self.init(String(value))
//	}
}
