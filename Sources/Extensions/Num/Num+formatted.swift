import Foundation

extension Double {
    func formatted(precision: Int) -> String {
        self.formatted(.number.precision(.fractionLength(precision)))
    }
}

//extension DoubleConvertible {
//    func formatted(precision: Int) -> String {
//        self.doubleValue.formatted(.number.precision(.fractionLength(precision)))
//    }
//}
