import Foundation

public extension Int {
    /// [Common]
    func hexEncodedString(options: Data.HexEncodingOptions = []) -> String {
        return withUnsafeBytes(of: bigEndian) { Data($0) }.hexEncodedString(options: options)
    }
}
