import SwiftUI

public final class Position: OptionSet, @unchecked Sendable {
    public let rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }

    public static let first = Position(rawValue: 1 << 0)
    public static let center = Position(rawValue: 1 << 1)
    public static let last = Position(rawValue: 1 << 2)

    public static let firstAndLast: Position = [.first, .last]
}

@ViewBuilder
public func positionalRender(
    subviews: SubviewsCollection,
    @ViewBuilder render: @escaping (_ subview: Subview, _ at: Position, _ index: Int) -> some View
) -> some View {
    if subviews.count == 1 {
        render(subviews[0], .firstAndLast, 0)
    }
    if subviews.count == 2 {
        render(subviews[0], .first, 0)
        render(subviews[1], .last, 1)
    }
    if subviews.count >= 3 {
        render(subviews[0],  .first, 0)
        ForEach(Array(subviews[1...subviews.lastIndex - 1].enumerated()), id: \.offset) { (index, subview) in
            render(subview, .center, index)
        }
        render(subviews[subviews.lastIndex], .last, subviews.lastIndex)
    }
}

//struct ItemInArrayInfo {
//    var index: Int
//    var totalCount: Int
//}

//struct Positional<Content: View>: View {
//    func params(subviews: SubviewsCollection) -> [Double] {
//        let relativeWidths = subviews.map {
//            $0.containerValues.relativeWidth
//        }
//        return relativeWidths
//    }
//
//    var body: some View {
//        Group(subviews: content) { subviews in
//            HStack(spacing: 0) {
//                let _ = params(subviews: subviews)
//
//                if subviews.count == 1 {
//                    segment(subview: subviews[0], at: .firstAndLast)
//                }
//                if subviews.count == 2 {
//                    segment(subview: subviews[0], at: .first)
//                    segment(subview: subviews[1], at: .last)
//                }
//                if subviews.count >= 3 {
//                    segment(subview: subviews[0], at: .first)
//                    ForEach(subviews[1...subviews.endIndex - 2]) { subview in
//                        segment(subview: subview, at: .center)
//                    }
//                    segment(subview: subviews[subviews.endIndex - 1], at: .last)
//                }
//            }
//        }
//    }
//
//    @ViewBuilder func segment(subview: Subview, at position: Position) -> some View {
//        let roundedSides: Corner = switch position {
//        case .firstAndLast: .all
//        case .first: .allLeft
//        case .last: .allRight
//        default: []
//        }
//        subview
//            .pill(color: subview.containerValues.bgColor, roundedSides: roundedSides)
//    }
//}
