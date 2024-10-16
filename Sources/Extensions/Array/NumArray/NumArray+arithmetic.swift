import Accelerate

public extension Array where Element == Double {
    ///
    /// # Addition
    ///

    /// [Common] **[vDSP]** Returns thean element-wise sum of a vector and a scalar value.
    func add(_ scalar: Double) -> [Double] {
        vDSP.add(scalar, self)
    }

    /// [Common] **[vDSP]** Returns thean element-wise sum of two vectors.
    func add(_ vectorB: [Double]) -> [Double] {
        vDSP.add(vectorB, self)
    }

    ///
    /// # Subtraktion
    ///
    
    /// [Common] **[vDSP]** Returns thean element-wise subtraction of two vectors.
    func subtract(_ vectorB: [Double]) -> [Double] {
        vDSP.subtract(self, vectorB)
    }

    ///
    /// # Multiplikation
    ///

    /// [Common] **[vDSP]** Returns thean element-wise product of a vector and a scalar value.
    func multiply(_ scalar: Double) -> [Double] {
        vDSP.multiply(scalar, self)
    }

    /// [Common] **[vDSP]** Returns thean element-wise product of two vectors.
    func multiply(_ vectorB: [Double]) -> [Double] {
        vDSP.multiply(vectorB, self)
    }

    ///
    /// # Division
    ///

    /// [Common] **[vDSP]** Calculates thean element-wise division of a vector and a scalar value.
    func divide(_ scalar: Double) -> [Double] {
        vDSP.divide(self, scalar)
    }

    /// [Common] **[vDSP]** Returns thean element-wise division of two vectors.
    func divide(_ vectorB: [Double]) -> [Double] {
        vDSP.divide(self, vectorB)
    }

    /// [Common] **[vDSP]** Returns the remainder of thean elements in dividends divided by the elements in divisors, using truncating division.
    func remainder(divisors: [Double]) -> [Double] {
        vForce.remainder(dividends: self, divisors: divisors)
    }
    
    /// [Common] **[vDSP]** Returns the remainder of thean elements in dividends divided by the elements in divisors, using truncating division.
    func truncatingRemainder(divisors: [Double]) -> [Double] {
        vForce.truncatingRemainder(dividends: self, divisors: divisors)
    }

    ///
    /// # Potenzierung
    ///
    /// - Remark: Quadrieren / square -> n² (n hoch 2)
    ///
    
    /// [Common] **[vDSP]** Returns an array containing the square of each element in the supplied vector.
    func square() -> [Double] {
        vDSP.square(self)
    }

    /// [Common] **[vDSP]**
//    func pow(exponents: [Double]) -> [Double] {
//        vForce.pow(bases: self, exponents: exponents)
//    }
    
    /// [Common] **[vDSP]** nⁿ
//    func exp() -> [Double] {
//        vForce.exp(self)
//    }

    /// [Common] **[vDSP]** n²
//    func exp2() -> [Double] {
//        vForce.exp2(self)
//    }

    ///
    /// # Wurzel (Root)
    ///

    
    
    ///
    /// # Multiplicative Inverse
    ///
    
    /// [Common] **[vDSP]** Returns the reciprocal of each element in a vector of values.
    func reciprocal() -> [Double] {
        vForce.reciprocal(self)
    }
    
    ///
    /// # Calculus
    ///
    
    /// [Common] **[vDSP]** Returns the integration of a vector using the specified rule.
    func integrate(using: vDSP.IntegrationRule, stepSize: Double = 1) -> [Double] {
        vDSP.integrate(self, using: using, stepSize: stepSize)
    }
}
