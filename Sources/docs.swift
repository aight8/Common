import SwiftUI
import PhotosUI

private func xxx() {
    // SWIFT.DataTypes.Date.spans.
}

public enum SWIFT {
    public enum DataTypes {
        case Character
        case String
        public enum Int {
            case UInt, UInt8, UInt16, UInt32, UInt64, UInt128
            case Int, Int8, Int16, Int32, Int64, Int128
        }
        case Double
        public enum Float {
            case Float32
            case Float64
        }
        case Bool

        public enum Date {
            public enum spans {
                case Duration /// 2x 64-bit integers
                case TimeInterval /// double
                case DateInterval /// two dates
            }

            public enum ranges {
                case Range_Date_ /// Range<Date>(uncheckedBounds: (lower: Date.distantPast, upper: Date.distantFuture))
                case ClosedRange_Date_ /// ClosedRange<Date>(uncheckedBounds: (lower: Date.distantPast, upper: Date.distantFuture))
            }
        }
    }

    public enum Protocols {
        
    }

    public enum FormatStyle {
        public enum DateInterval {
        }
        public enum TimeInterval {
        }
        public enum Duration {
        }
        public enum DateRange {
        }
        public enum Double {
            case number
            case percent
            case currency
        }
    }

    public enum Chart {
        public enum Mark {
            case Area
            case Line
            case Point
            case Rectangle
            case Rule
            case Bar
            case Sector
        }
        public enum Bin {
            case Date
            case Number
        }
    }

    public enum Presentation {
        case ConfirmationDialog // Previously actionSheet
        case Alert
        case Sheet
        case Popover
        case FullScreenCover
        case Inspector

        public enum File {
            case FileExporter
            case FileImporter
            case FileMover
        }

        public enum PhotosUI {
            case PhotosPicker
        }
    }

    public enum Shape {
        case Rectangle
        case RoundedRectangle
        case UnevenRoundedRectangle
        case Circle
        case Capsule
        case Ellipse
        case Path
        
        public enum Wrapper {
            /// Conforms when Content conforms to InsettableShape.
            case OffsetShape
            case RotatedShape
            case ScaledShape
            case TransformedShape
        }
        
        public enum more {
            case ContainerRelativeShape
            case ButtonBorderShape
        }
    }
    
    public enum Gradient {
        case Gradient
        case RadialGradient
        case MeshGradient
        case EllipticalGradient
        case LinearGradient
    }
    
    public enum Layout {
        /// HStack: Arranges its children in a horizontal line.
        case HStack
        /// VStack: Arranges its children in a vertical line.
        case VStack

        // ZStack: Overlays its children on top of each other, based on the order in which they are declared.
        case ZStack

        // Form: A container view that arranges its children in a way that resembles a form, suitable for input fields and labels.
        case Form
        // List: Displays a scrollable list of views, with each child representing a row in the list.
        case List

        // ScrollView: A scrollable container for its children, which can be either vertically or horizontally oriented.
        case ScrollView
        // LazyVStack: A vertically scrolling stack that lazily loads views as they come into view, suitable for large datasets.
        case LazyVStack
        // LazyHStack: A horizontally scrolling stack that lazily loads views as they come into view.
        case LazyHStack

        // Grid (introduced in iOS 14): Arranges views in a flexible grid layout, which can be configured with rows and columns.
        case Grid
        // LazyVGrid: A grid layout that lazily loads its children vertically, based on a set of flexible columns.
        case LazyVGrid
        // LazyHGrid: A grid layout that lazily loads its children horizontally, based on a set of flexible rows.
        case LazyHGrid

        // Spacer: Adds flexible space to fill any remaining space between views.
        case Spacer
        // Divider: A visual line that separates content vertically or horizontally.
        case Divider
        // Group: A layout container that groups multiple views together, but without affecting the layout or view hierarchy.
        case Group

        // OutlineGroup: A view that displays a hierarchical list of data, similar to an outline view.
        case OutlineGroup
        // DisclosureGroup: A view that toggles the visibility of its child views.
        case DisclosureGroup

        // GeometryReader: A container view that provides access to the size and position of its child views.
        case GeometryReader
    }
    
    enum Collections {
        case Array
        case Set
        case Dictionary
        
        public enum Custom {
            case OrderedDictionary
            case OrderedSet
            case CircularBuffer
        }
        
        public enum Protocols {
            case RandomAccessCollection
            case RangeReplaceableCollection
            case MutableCollection
        }
    }
}

public struct SwiftFonts: View {
    public var text: String

    public init(text: String) {
        self.text = text
    }
    
    @ViewBuilder
    func fontGridRow(font: Font, description: String) -> some View {
        GridRow(alignment: .top) {
            Text(text).font(font)
                .gridColumnAlignment(.leading)
            Text(description).font(.system(size: 10, weight: .medium, design: .rounded))
                .gridColumnAlignment(.trailing)
        }
    }

    public var body: some View {
        Grid(alignment: .bottom, horizontalSpacing: 0, verticalSpacing: 0) {
            Divider().gridCellUnsizedAxes(.horizontal)
            fontGridRow(font: .headline, description: "headline")
            fontGridRow(font: .subheadline, description: "subheadline")
            Divider().gridCellUnsizedAxes(.horizontal)
            fontGridRow(font: .body, description: "body")
            fontGridRow(font: .callout, description: "callout")
            fontGridRow(font: .footnote, description: "footnote")
            Divider().gridCellUnsizedAxes(.horizontal)
            fontGridRow(font: .caption, description: "caption")
            fontGridRow(font: .caption2, description: "caption2")
            Divider().gridCellUnsizedAxes(.horizontal)
            fontGridRow(font: .largeTitle, description: "largeTitle")
            fontGridRow(font: .title, description: "title")
            fontGridRow(font: .title2, description: "title2")
            fontGridRow(font: .title3, description: "title3")
            Divider().gridCellUnsizedAxes(.horizontal)
            fontGridRow(font: .system(size: 12, weight: .medium, design: .default), description: "12 medium default")
            fontGridRow(font: .system(size: 12, weight: .medium, design: .rounded), description: "12 medium rounded")
            fontGridRow(font: .system(size: 12, weight: .medium, design: .serif), description: "12 medium serif")
            fontGridRow(font: .system(size: 12, weight: .medium, design: .monospaced), description: "12 medium monospaced")
        }
        .padding()
        .border(.red, width: 2)
    }
}
