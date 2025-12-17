import SwiftUI

public extension Image {
    #if canImport(AppKit)
    init(image: NSImage) {
        self = Image(nsImage: image)
    }
    #endif

    #if canImport(UIKit)
    init(image: UIImage) {
        self = Image(uiImage: image)
    }
    #endif
}
