// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Common",
	platforms: [.macOS(.v15), .iOS(.v18)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Common",
            targets: ["Common"]
		),
    ],
	dependencies: [
		// Here we define our package's external dependencies
		// and from where they can be fetched:
		.package(url: "https://github.com/buh/CompactSlider.git", from: "1.1.6")
	],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
		.target(
			name: "Common",
			dependencies: ["CompactSlider"]
		),
    ]
)
