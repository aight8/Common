//import RandomFloat
//import XCTest
//
//final class RandomFloatTests: XCTestCase {
//    override class var defaultMetrics: [XCTMetric] {
//        [
//            XCTClockMetric(),
//            XCTCPUMetric(limitingToCurrentThread: true),
//            XCTMemoryMetric(),
//            XCTStorageMetric(),
//        ]
//    }
//    
//    func test() {
//        let floatsPerRun = 10_000_000
//        var meanSum = 0.0
//        var numRuns = 0
//        var prng = WyRand()
//        
//        measure(metrics: Self.defaultMetrics) {
//            var sum = 0.0
//            for _ in 0 ..< floatsPerRun {
//                let v = pseudorandomFloatInClosedUnitRange(using: &prng)
//                sum += Double(v)
//            }
//            meanSum += sum
//            numRuns += 1
//        }
//        
//        print("Total mean float value:",
//              meanSum / Double(floatsPerRun * numRuns))
//    }
//}
