import Foundation
import Common
import Testing
import Accelerate

struct AlgoTests {
    @Test func xxx() {
        let arr = [1,2,3,4,5]

        print(
            arr.adjacentPairs().toArray()
        )

        print(
            arr.windows(ofCount: 2).toArray()
        )

        print(
            arr.padded(count: 2)
        )

//        print(
//            arr.append(<#T##newElement: Int##Int#>)
//        )

//        #expect(
//
//        )
    }
}
