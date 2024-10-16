import Foundation

public extension CGRect {
    ///
    /// Edge Points
    ///

    /// [Common]
    var topRight: CGPoint {
        CGPoint(x: maxX, y: minY)
    }
    
    /// [Common]
    var bottomRight: CGPoint {
        CGPoint(x: maxX, y: maxY)
    }
    
    /// [Common]
    var bottomLeft: CGPoint {
        CGPoint(x: minX, y: maxY)
    }
    
    /// [Common]
    var topLeft: CGPoint {
        CGPoint(x: minX, y: minY)
    }

    ///
    /// Center Points
    ///

    /// [Common]
    var top: CGPoint {
        CGPoint(x: midX, y: minY)
    }
    
    /// [Common]
    var right: CGPoint {
        CGPoint(x: maxX, y: midY)
    }
    
    /// [Common]
    func xxx() -> CGPoint {
        CGPoint(x: maxX, y: midY)
    }
    
    /// [Common]
    var bottom: CGPoint {
        CGPoint(x: midX, y: maxY)
    }
    
    /// [Common]
    func width(percent: Double) -> CGPoint {
        CGPoint(x: self.width * (percent/100), y: 0)
    }
    func height(percent: Double) -> CGPoint {
        CGPoint(x: 0, y: height * (percent/100))
    }
//    func widthPercent(percent: Double) -> CGPoint {
//        CGPoint(x: self.width, y: 0)
//    }
}
