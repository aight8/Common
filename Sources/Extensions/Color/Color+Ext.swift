import SwiftUI

public extension Color {
    /// [Common]
    func lighten(by fraction: Double) -> Color {
        self.mix(with: .white, by: fraction)
    }
    
    /// [Common]
    func darken(by fraction: Double) -> Color {
        self.mix(with: .black, by: fraction)
    }
}

extension Color: Codable {
    init(hex: String) {
        let rgba = hex.toRGBA()

        self.init(
            .sRGB,
            red: Double(rgba.r),
            green: Double(rgba.g),
            blue: Double(rgba.b),
            opacity: Double(rgba.alpha)
        )
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let hex = try container.decode(String.self)
        
        self.init(hex: hex)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(toHex())
    }

    func toHex(alpha: Bool = false) -> String? {
        guard let components = cgColor?.components, components.count >= 3 else {
            return nil
        }

        let r = Float(components[0])
        let g = Float(components[1])
        let b = Float(components[2])
        var a = Float(1.0)

        if components.count >= 4 {
            a = Float(components[3])
        }

        if alpha {
            return String(
                format: "%02lX%02lX%02lX%02lX",
                lroundf(r * 255),
                lroundf(g * 255),
                lroundf(b * 255),
                lroundf(a * 255)
            )
        }
        else {
            return String(
                format: "%02lX%02lX%02lX",
                lroundf(r * 255),
                lroundf(g * 255),
                lroundf(b * 255)
            )
        }
    }
}
