import Foundation
import Common
import Testing
import Accelerate

let D_jan_1_0__0_0_0 = Date(year: 200, month: 1)
let D_jan_1_0__0_0_1 = Date(year: 200, month: 1, second: 1)
let D_jan_1_0__0_1_0 = Date(year: 200, month: 1, minute: 1)

struct ArrayTests {
    @Test func distancesRelativeToPrevious() {
        #expect([2, 3, 5, 7, 11].distancesRelativeToPrevious(skipFirst: true) == [1, 2, 2, 4])
        #expect([D_jan_1_0__0_0_0, D_jan_1_0__0_0_1, D_jan_1_0__0_1_0].distancesRelativeToPrevious(skipFirst: true) == [1, 59])
    }

    @Test func distancesRelativeToFirst() {
        #expect([2, 3, 5, 7, 11].distancesRelativeToFirst() == [0, 1, 3, 5, 9])
        #expect([D_jan_1_0__0_0_0, D_jan_1_0__0_0_1, D_jan_1_0__0_1_0].distancesRelativeToFirst() == [0, 1, 60])
    }

    @Test func nearest() {
        #expect([2, 3, 5, 7, 11].nearest(to: 8) == 7)
        #expect([2, 3, 5, 7, 11].nearest(to: 9) == 7)
        #expect([2, 3, 5, 7, 11].nearest(to: 10) == 11)
        #expect([D_jan_1_0__0_0_0, D_jan_1_0__0_0_1, D_jan_1_0__0_1_0].nearest(to: Date(year: 200, month: 1, second: 3)) == D_jan_1_0__0_0_1)
        #expect([D_jan_1_0__0_0_0, D_jan_1_0__0_0_1, D_jan_1_0__0_1_0].nearest(to: Date(year: 200, month: 1, second: 30)) == D_jan_1_0__0_0_1)
        #expect([D_jan_1_0__0_0_0, D_jan_1_0__0_0_1, D_jan_1_0__0_1_0].nearest(to: Date(year: 200, month: 1, second: 31)) == D_jan_1_0__0_1_0)
    }

    @Test func nearestIndex() {
        #expect([2, 3, 5, 7, 11].nearestIndex(to: 8) == 3)
        #expect([2, 3, 5, 7, 11].nearestIndex(to: 9) == 3)
        #expect([2, 3, 5, 7, 11].nearestIndex(to: 10) == 4)
    }
}
