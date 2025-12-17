import Foundation
import Common
import Testing
import Accelerate

let A_EMPTY: [Double] = []
let A_1: [Double] = [1]
let A_1_1: [Double] = [1, 1]
let A_1_2: [Double] = [1, 2]
let A_1_2_3: [Double] = [1, 2, 3]
let A_1_2_3_4: [Double] = [1, 2, 3, 4]

struct DoubleArrayTests {
    ///
    ///# Padded
    ///

    @Test func paddedValue() {
        #expect(A_EMPTY.padded(count: 1) == [])
        #expect(A_1.padded(count: 1) == [1, 1, 1])
        #expect(A_1_2.padded(count: 1) == [1, 1, 2, 2])
        #expect(A_1_2_3.padded(count: 1) == [1, 1, 2, 3, 3])
    }

    ///
    ///# Convolve
    ///
    
    @Test func convolve() {
        #expect(A_1_2_3.convolve(with: [0, 2, 0]) == [2.0, 4.0, 6.0])
        #expect(A_1_2_3.convolve(with: [0, 2]) == [2.0, 4.0, 6.0])
        #expect(A_1_2_3.convolve(with: [2]) == [2.0, 2.0, 4.0])
        #expect(A_1_2_3.convolve(with: [1, 2, 1]) == [5.0, 8.0, 11.0])
        #expect(A_EMPTY.convolve(with: [1, 1, 1]) == [])
        #expect(A_1.convolve(with: [1, 1, 1]) == [3.0])
        #expect(A_1_1.convolve(with: [1, 1, 1]) == [3.0, 3.0])
    }
    
    @Test func convolve_convolveAccel_sameOutput() {
        testConvolve(input: [1], kernel: [1, 1, 1], expect: [3])
        testConvolve(input: [1, 1], kernel: [1, 1, 1], expect: [3, 3])
        testConvolve(input: [1, 1, 1], kernel: [1, 1, 1], expect: [3, 3, 3])
        testConvolve(input: [1, 1, 1, 1], kernel: [1, 1, 1], expect: [3, 3, 3, 3])
        testConvolve(input: [1, 1, 1, 1, 1], kernel: [1, 1, 1], expect: [3, 3, 3, 3, 3])
        testConvolve(input: [1, 1, 1, 1, 1, 1], kernel: [1, 1, 1], expect: [3, 3, 3, 3, 3, 3])
    }
    
    internal func testConvolve(input: [Double], kernel: [Double], expect: [Double]) {
        let resImpl = input.convolve(with: kernel)
        let resAccel = input.convolveAccel(with: kernel)
        #expect(resImpl == expect)
        #expect(resAccel == expect)
    }

//    @Test func convolveXXX_13() {
//        let dblArray: [Double] = [1,2,3,4,5,6,7,8,9]
//
//        print(
//            dblArray.convolve(windowSize: 3, fn: { window in
//                window.reduce(0, +)
//            })
//        )
//    }
}
