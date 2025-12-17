import Foundation

//@propertyWrapper
//public struct Cached<Value> {
//    private var cachedValue: Value?
//    private let compute: () -> Value
//    private var lastSignature: Int?
//
//    private var dependencies: [() -> AnyHashable]
//
//    init(
//        wrappedValue: @escaping () -> Value,
//        dependencies: [() -> AnyHashable]
//    ) {
//        self.compute = wrappedValue
//        self.dependencies = dependencies
//    }
//
//    public var wrappedValue: Value {
//        mutating get {
//            let currentSignature = computeSignature()
//
//            if lastSignature != currentSignature {
//                // Cache is invalid, recompute the value
//                cachedValue = compute()
//                lastSignature = currentSignature
//            }
//
//            return cachedValue!
//        }
//    }
//
//    private func computeSignature() -> Int {
//        // Create a hash based on the current values of the dependencies
//        var hasher = Hasher()
//        for dependency in dependencies {
//            hasher.combine(dependency())
//        }
//        return hasher.finalize()
//    }
//}

// EXAMPLE:
//struct CachedCalculation {
//    var input1: Int
//    var input2: Int
//
//    @Cached(dependencies: [ { input1 }, { input2 } ])
//    var expensiveResult: Int = {
//        return input1 * input2
//    }
//}
