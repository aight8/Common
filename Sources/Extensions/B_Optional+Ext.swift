import Foundation

/// Makes optional values **Hashable** if the wrapped value is **Hashable**
extension Optional: Hashable where Wrapped: Hashable {
	public func hash(into hasher: inout Hasher) {
		switch self {
			case .none:
				hasher.combine(0 as UInt8)
			case .some(let wrapped):
				hasher.combine(1 as UInt8)
				hasher.combine(wrapped)
		}
	}
}

public extension Optional {
	/// SwifterSwift: Get self of default value (if self is nil).
	///
	///		let foo: String? = nil
	///		print(foo.unwrapped(or: "bar")) -> "bar"
	///
	///		let bar: String? = "bar"
	///		print(bar.unwrapped(or: "foo")) -> "bar"
	///
	/// - Parameter defaultValue: default value to return if self is nil.
	/// - Returns: self if not nil or default value if nil.
	func unwrapped(or defaultValue: Wrapped) -> Wrapped {
		// http://www.russbishop.net/improving-optionals
		return self ?? defaultValue
	}

	/// SwifterSwift: Assign an optional value to a variable only if the value is not nil.
	///
	///     let someParameter: String? = nil
	///     let parameters = [String: Any]() // Some parameters to be attached to a GET request
	///     parameters[someKey] ??= someParameter // It won't be added to the parameters dict
	///
	/// - Parameters:
	///   - lhs: Any?
	///   - rhs: Any?
	static func ??= (lhs: inout Optional, rhs: Optional) {
		guard let rhs = rhs else { return }
		lhs = rhs
	}

	/// SwifterSwift: Assign an optional value to a variable only if the variable is nil.
	///
	///     var someText: String? = nil
	///     let newText = "Foo"
	///     let defaultText = "Bar"
	///     someText ?= newText // someText is now "Foo" because it was nil before
	///     someText ?= defaultText // someText doesn't change its value because it's not nil
	///
	/// - Parameters:
	///   - lhs: Any?
	///   - rhs: Any?
	static func ?= (lhs: inout Optional, rhs: @autoclosure () -> Optional) {
		if lhs == nil {
			lhs = rhs()
		}
	}
}

// MARK: - Operators

infix operator ??=: AssignmentPrecedence
infix operator ?=: AssignmentPrecedence

