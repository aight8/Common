//import Accelerate
//
//public extension Array where Element == Double {
//    ///
//    /// # Sinus
//    ///
//    
//    /// [Common] **[vDSP]** Returns the sine of each element.
//    func sin() -> [Double] { vForce.sin(self) }
//    
//    /// [Common] **[vDSP]** Returns the hyperbolic sine of each element.
//    func sinh() -> [Double] { vForce.sinh(self) }
//    
//    /// [Common] **[vDSP]** Returns the arcsine of each element.
//    func asin() -> [Double] { vForce.asin(self) }
//    
//    /// [Common] **[vDSP]** Returns the inverse hyperbolic sine of each element.
//    func asinh() -> [Double] { vForce.asinh(self) }
//    
//    /// [Common] **[vDSP]** Returns the sine of pi, multiplied by each element.
//    func sinPi() -> [Double] { vForce.sinPi(self) }
//
//    ///
//    /// # Cosinus
//    ///
//
//    /// [Common] **[vDSP]** Returns the cosine of each element.
//    func cos() -> [Double] { vForce.cos(self) }
//    
//    /// [Common] **[vDSP]** Returns the hyperbolic cosine of each element.
//    func cosh() -> [Double] { vForce.cosh(self) }
//    
//    /// [Common] **[vDSP]** Returns the arccosine of each element.
//    func acos() -> [Double] { vForce.acos(self) }
//    
//    /// [Common] **[vDSP]** Returns the inverse hyperbolic cosine of each element.
//    func acosh() -> [Double] { vForce.acosh(self) }
//    
//    /// [Common] **[vDSP]** Returns the cosine of pi, multiplied by each element.
//    func cosPi() -> [Double] { vForce.cosPi(self) }
//    
//    ///
//    /// # Tangent
//    ///
//    
//    /// [Common] **[vDSP]** Returns the tangent of each element.
//    func tan() -> [Double] { vForce.tan(self) }
//    
//    /// [Common] **[vDSP]** Returns the hyperbolic tangent of each element.
//    func tanh() -> [Double] { vForce.tanh(self) }
//    
//    /// [Common] **[vDSP]** Returns the arctangent of each element.
//    func atan() -> [Double] { vForce.atan(self) }
//    
//    /// [Common] **[vDSP]** Returns the inverse hyperbolic tangent of each element.
//    func atanh() -> [Double] { vForce.atanh(self) }
//    
//    /// [Common] **[vDSP]** Returns the tangent of pi, multiplied by each element.
//    func tanPi() -> [Double] { vForce.tanPi(self) }
//    
//    ///
//    /// # Others
//    ///
//
//    /// [Common] **[vDSP]** Returns a compressed copy of the specified vector using the nonzero values in a gating vector.
//    func dot(_ vectorB: [Double]) -> Double { vDSP.dot(self, vectorB) }
//    
//    /// [Common] **[vDSP]** Returns the hypotenuses of right triangles with legs that
//    /// are the lengths of corresponding elements of the two input vectors.
//    func hypot(_ vectorB: [Double]) -> [Double] { vDSP.hypot(self, vectorB) }
//}
