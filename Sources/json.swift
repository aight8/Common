import SwiftUI

public struct JSONClass: Sendable {

    public func encode<T: Encodable>(value: T) -> String {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .withoutEscapingSlashes, .sortedKeys]
        // encoder.dataEncodingStrategy = .base64
        // encoder.dateEncodingStrategy = .deferredToDate
        // encoder.nonConformingFloatEncodingStrategy = .convertToString(positiveInfinity: <#T##String#>, negativeInfinity: <#T##String#>, nan: <#T##String#>)

        let jsonData = try! encoder.encode(value)
        let jsonString = String(data: jsonData, encoding: .utf8)

        return jsonString!
    }

    /// Encodes a value to a pretty-printed JSON string.
    // public func encode<T: Encodable>(value: T) -> String {
    //     let encoder = JSONEncoder()
    //     encoder.outputFormatting = .prettyPrinted
   
    //     guard let jsonData = try? encoder.encode(value),
    //           let jsonString = String(data: jsonData, encoding: .utf8) else {
    //         fatalError("Failed to encode value to JSON.")
    //     }
   
    //     return jsonString
    // }

    /// Decodes a JSON string into a specified Decodable type.
    public func decode<T: Decodable>(json: String, as type: T.Type) -> T {
        let decoder = JSONDecoder()

        guard let jsonData = json.data(using: .utf8) else {
            fatalError("Failed to convert JSON string to Data.")
        }

        guard let value = try? decoder.decode(T.self, from: jsonData) else {
            fatalError("Failed to decode JSON to \(T.self).")
        }

        return value
    }
}

public let JSON = JSONClass()

// encodeJson // jsonEncode // toJson // encodeJSON // JSONEncode // toJSON
// decodeJson // jsonDecode // fromJson // decodeJSON // JSONDecode // fromJSON
// jsonDecode... Pretty (formatted), Raw (bytes), ....sortedKeys, withoutEscapingSlashes

// public func encodeToJson<T: Encodable>(value: T) -> String {
//     let encoder = JSONEncoder()
//     encoder.outputFormatting = .prettyPrinted
//
//     let jsonData = try! encoder.encode(value)
//     let jsonString = String(data: jsonData, encoding: .utf8)
//
//     return jsonString!
// }
//
// public func encodeToJson2<T: Encodable>(value: T) -> String {
//     let jsonData = try! JSONSerialization.data(withJSONObject: value, options: .prettyPrinted)
//     let jsonString = String(data: jsonData, encoding: .utf8)
//
//     return jsonString!
// }
//
// public func decodeFromJson() {
//
// }
