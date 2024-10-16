import SwiftUI

public struct Crosshair: Shape {
    public init() {
    }
    
    public func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: rect.topLeft)
            path.addLine(to: rect.bottomRight)
            path.closeSubpath()
            
            path.move(to: rect.bottomLeft)
            path.addLine(to: rect.topRight)
            path.closeSubpath()
            
            path.move(to: rect.topLeft)
            path.addLine(to: rect.topRight)
            path.addLine(to: rect.bottomRight)
            path.addLine(to: rect.bottomLeft)
            path.closeSubpath()
        }
    }
}
