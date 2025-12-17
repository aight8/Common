import Foundation
import Common
import Testing

let D_31_dec_23__24_59_59 = Date(year: 2023, month: 12, day: 31, hour: 23, minute: 59, second: 59)
let D_1_jan_24__0_0_0 = Date(year: 2024, month: 1)
let D_jan_1_24__0_0_1 = Date(year: 2024, month: 1, second: 1)

struct DateTests {
    @Test func distance() {
//      #expect(false)
    }

    ///
    /// # From
    ///

    @Test func distance_to_is_FROM_1() {
        #expect(D_1_jan_24__0_0_0.distance(to: D_jan_1_24__0_0_1, is: Duration.seconds(0.9)...))
    }
    
    @Test func distance_to_is_FROM_2() {
        #expect(D_1_jan_24__0_0_0.distance(to: D_jan_1_24__0_0_1, is: Duration.seconds(1)...))
    }

    @Test func distance_to_is_FROM_3() {
        #expect(false == D_1_jan_24__0_0_0.distance(to: D_jan_1_24__0_0_1, is: Duration.seconds(2)...))
    }
    
    @Test func distance_to_is_FROM_4() {
        #expect(false == D_1_jan_24__0_0_0.distance(to: D_31_dec_23__24_59_59, is: Duration.seconds(-0.5)...))
    }
    
    @Test func distance_to_is_FROM_5() {
        #expect(D_1_jan_24__0_0_0.distance(to: D_31_dec_23__24_59_59, is: Duration.seconds(-1)...))
    }
    
    @Test func distance_to_is_FROM_6() {
        #expect(D_1_jan_24__0_0_0.distance(to: D_31_dec_23__24_59_59, is: Duration.seconds(-2)...))
    }

    ///
    /// # Through
    ///

    @Test func distance_to_is_THROUGH_1() {
        #expect(false == D_1_jan_24__0_0_0.distance(to: D_jan_1_24__0_0_1, is: ...Duration.seconds(0.9)))
    }
    
    @Test func distance_to_is_THROUGH_2() {
        #expect(D_1_jan_24__0_0_0.distance(to: D_jan_1_24__0_0_1, is: ...Duration.seconds(1)))
    }
    
    @Test func distance_to_is_THROUGH_3() {
        #expect(D_1_jan_24__0_0_0.distance(to: D_jan_1_24__0_0_1, is: ...Duration.seconds(2)))
    }
    
    @Test func distance_to_is_THROUGH_4() {
        #expect(D_1_jan_24__0_0_0.distance(to: D_31_dec_23__24_59_59, is: ...Duration.seconds(-0.5)))
    }

    @Test func distance_to_is_THROUGH_5() {
        #expect(D_1_jan_24__0_0_0.distance(to: D_31_dec_23__24_59_59, is: ...Duration.seconds(-1)))
    }
    
    @Test func distance_to_is_THROUGH_6() {
        #expect(false == D_1_jan_24__0_0_0.distance(to: D_31_dec_23__24_59_59, is: ...Duration.seconds(-2)))
    }
    
    ///
    /// # To
    ///
    
    @Test func distance_to_is_TO_1() {
        #expect(false == D_1_jan_24__0_0_0.distance(to: D_jan_1_24__0_0_1, is: ..<Duration.seconds(0.9)))
    }
    
    @Test func distance_to_is_TO_2() {
        #expect(false == D_1_jan_24__0_0_0.distance(to: D_jan_1_24__0_0_1, is: ..<Duration.seconds(1)))
    }
    
    @Test func distance_to_is_TO_3() {
        #expect(D_1_jan_24__0_0_0.distance(to: D_jan_1_24__0_0_1, is: ..<Duration.seconds(2)))
    }
    
    @Test func distance_to_is_TO_4() {
        #expect(D_1_jan_24__0_0_0.distance(to: D_31_dec_23__24_59_59, is: ..<Duration.seconds(-0.5)))
    }
    
    @Test func distance_to_is_TO_5() {
        #expect(false == D_1_jan_24__0_0_0.distance(to: D_31_dec_23__24_59_59, is: ..<Duration.seconds(-1)))
    }
    
    @Test func distance_to_is_TO_6() {
        #expect(false == D_1_jan_24__0_0_0.distance(to: D_31_dec_23__24_59_59, is: ..<Duration.seconds(-2)))
    }
    
    ///
    /// # Range
    ///
    
    @Test func distance_to_is_RANGE_1() {
        #expect(D_1_jan_24__0_0_0.distance(to: D_jan_1_24__0_0_1, is: Duration.seconds(0)..<Duration.seconds(2)))
    }
    
    @Test func distance_to_is_RANGE_2() {
        #expect(false == D_1_jan_24__0_0_0.distance(to: D_jan_1_24__0_0_1, is: Duration.seconds(0)..<Duration.seconds(1)))
    }
    
    @Test func distance_to_is_RANGE_3() {
        #expect(D_1_jan_24__0_0_0.distance(to: D_jan_1_24__0_0_1, is: Duration.seconds(1)..<Duration.seconds(2)))
    }
    
    @Test func distance_to_is_RANGE_4() {
        #expect(false == D_1_jan_24__0_0_0.distance(to: D_31_dec_23__24_59_59, is: Duration.seconds(-0.5)..<Duration.seconds(1)))
    }

    @Test func distance_to_is_RANGE_5() {
        #expect(D_1_jan_24__0_0_0.distance(to: D_31_dec_23__24_59_59, is: Duration.seconds(-1)..<Duration.seconds(1)))
    }
    
    @Test func distance_to_is_RANGE_6() {
        #expect(D_1_jan_24__0_0_0.distance(to: D_31_dec_23__24_59_59, is: Duration.seconds(-2)..<Duration.seconds(1)))
    }

    ///
    /// # ClosedRange
    ///

    @Test func distance_to_is_CLOSED_RANGE_1() {
        #expect(D_1_jan_24__0_0_0.distance(to: D_jan_1_24__0_0_1, is: Duration.seconds(0)...Duration.seconds(2)))
    }
    
    @Test func distance_to_is_CLOSED_RANGE_2() {
        #expect(D_1_jan_24__0_0_0.distance(to: D_jan_1_24__0_0_1, is: Duration.seconds(0)...Duration.seconds(1)))
    }
    
    @Test func distance_to_is_CLOSED_RANGE_3() {
        #expect(D_1_jan_24__0_0_0.distance(to: D_jan_1_24__0_0_1, is: Duration.seconds(1)...Duration.seconds(2)))
    }
    
    @Test func distance_to_is_CLOSED_RANGE_4() {
        #expect(false == D_1_jan_24__0_0_0.distance(to: D_31_dec_23__24_59_59, is: Duration.seconds(-0.5)...Duration.seconds(1)))
    }
    
    @Test func distance_to_is_CLOSED_RANGE_5() {
        #expect(D_1_jan_24__0_0_0.distance(to: D_31_dec_23__24_59_59, is: Duration.seconds(-1)...Duration.seconds(1)))
    }

    @Test func distance_to_is_CLOSED_RANGE_6() {
        #expect(D_1_jan_24__0_0_0.distance(to: D_31_dec_23__24_59_59, is: Duration.seconds(-2)...Duration.seconds(1)))
    }
}
