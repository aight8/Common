import Foundation
import Common
import Testing
import Accelerate

struct NormalizerTests {
    @Test func normalizers() {
        let dbls = [
            -5.0,
            -0.01,
            0.0,
            0.01,
            10.0
        ]
        #expect(dbls.count == 5)
        #expect(dbls.minimum() == -5.0)
        #expect(dbls.maximum() == 10.0)
        #expect(dbls.sum() == 5.0)
        #expect(dbls.median() == 0.0)
        #expect(dbls.standardDeviation() == 4.89898356804756)
        
        #expect(dbls.distancesRelativeToFirst() == [0.0, 4.99, 5.0, 5.01, 15.0])
        #expect(dbls.distancesRelativeToPrevious() == [0.0, 4.99, 0.01, 0.01, 9.99])

        ///
        /// MinMax
        ///
        
        let MinMax = [
            0.0,
            0.33266666666666667,
            0.3333333333333333,
            0.33399999999999996,
            1.0
        ]
        #expect(dbls.normalizedMinMax() == MinMax)
        #expect(dbls.normalizedMinMax().minimum() == 0.0)
        #expect(dbls.normalizedMinMax().maximum() == 1.0)
        #expect(dbls.normalizedMinMax().sum() == 2.0)

        ///
        /// Max
        ///
        
        let Max = [
            -0.5,
             -0.001,
             0.0,
             0.001,
             1.0
        ]
        #expect(dbls.normalizedMax() == Max)
        #expect(dbls.normalizedMax().minimum() == -0.5)
        #expect(dbls.normalizedMax().maximum() == 1.0)
        #expect(dbls.normalizedMax().sum() == 0.5)

        ///
        /// L1
        ///
        
        let L1 = [
            -0.33288948069241014,
             -0.0006657789613848203,
             0.0,
             0.0006657789613848203,
             0.6657789613848203
        ]
        #expect(dbls.normalizedL1() == L1)
        #expect(dbls.normalizedL1().minimum() == -0.33288948069241014)
        #expect(dbls.normalizedL1().maximum() == 0.6657789613848203)
        #expect(dbls.normalizedL1().sum() == 0.33288948069241014)

        ///
        /// Mean
        ///

        let Mean = [
            -0.4,
             -0.06733333333333333,
             -0.06666666666666667,
             -0.066,
             0.6
        ]
        #expect(dbls.normalizedMean() == Mean)
        #expect(dbls.normalizedMean().minimum() == -0.4)
        #expect(dbls.normalizedMean().maximum() == 0.6)
        #expect(dbls.normalizedMean().sum() == 0.0)

        ///
        /// ZScore
        ///

        let ZScore = [
            -1.2247438507721384,
             -0.20616521487997666,
             -0.20412397512868974,
             -0.20208273537740284,
             1.8371157761582078
        ]
        #expect(dbls.normalizedZScore() == ZScore)
        #expect(dbls.normalizedZScore().minimum() == -1.2247438507721384)
        #expect(dbls.normalizedZScore().maximum() == 1.8371157761582078)
        #expect(dbls.normalizedZScore().sum() == 2.220446049250313e-16)
        
        
        let ZScoreAccel = [
            -1.2247438507721384,
             -0.20616521487997663,
             -0.20412397512868974,
             -0.20208273537740284,
             1.8371157761582078
        ]
        #expect(dbls.normalizedZScoreAccel() == ZScoreAccel)
        #expect(dbls.normalizedZScoreAccel().minimum() == -1.2247438507721384)
        #expect(dbls.normalizedZScoreAccel().maximum() == 1.8371157761582078)
        #expect(dbls.normalizedZScoreAccel().sum() == 2.220446049250313e-16)
    }
}
