// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "Common",
	platforms: [
        .macOS(.v15),
        .iOS(.v18)
    ],
    products: [
        .library(
            name: "Common",
            targets: ["Common"],
		),
//        .executable(
//            name: "Benchmarks",
//            targets: ["Benchmarks"],
//        ),
    ],
	dependencies: [
        .package(url: "https://github.com/buh/CompactSlider.git", from: "1.1.6"),
        .package(url: "https://github.com/apple/swift-algorithms", from: "1.2.0"),
		.package(url: "https://github.com/ordo-one/package-benchmark", from: "1.25.0"),
//        .package(url: "https://github.com/google/swift-benchmark", from: "0.1.2"),
	],
    targets: [
		.target(
			name: "Common",
			dependencies: [
                "CompactSlider",
                .product(name: "Algorithms", package: "swift-algorithms")
            ],
            path: "Sources"
		),
        .testTarget(
            name: "CommonTests",
            dependencies: [
                "Common",
                .product(name: "Benchmark", package: "package-benchmark")
            ],
            path: "CommonTests"
        ),
//        .target(
//            name: "Benchmarks",
//            dependencies: [
//                "Common",
//                .product(name: "Benchmark", package: "swift-benchmark")
//            ],
//            path: "Benchmarks"
//        ),
    ]
//    swiftLanguageModes: [
//        .v6
//    ]
)
