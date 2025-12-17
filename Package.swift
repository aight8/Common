// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "Common",
    platforms: [
        .macOS(.v15),
        .iOS(.v18),
    ],
    products: [
        .library(
            name: "Common",
            targets: ["Common"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-algorithms", from: "1.2.0"),
        .package(url: "https://github.com/apple/swift-collections", from: "1.1.4")
    ],
    targets: [
        .target(
            name: "Common",
            dependencies: [
                .product(name: "Algorithms", package: "swift-algorithms"),
                .product(name: "Collections", package: "swift-collections")
            ],
            path: "Sources"
        ),
        .testTarget(
            name: "CommonTests",
            dependencies: [
                "Common",
            ],
            path: "CommonTests"
        ),
    ]
)
