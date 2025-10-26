// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "KotlinMultiplatformLibrary",
    platforms: [.iOS(.v17)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "KotlinMultiplatformLibrary",
            targets: ["KotlinMultiplatformLibrary"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "KotlinMultiplatformLibrary",
            resources: [
                .process("Resources")
            ]
        ),
        .testTarget(
            name: "KotlinMultiplatformLibraryTests",
            dependencies: ["KotlinMultiplatformLibrary"]
        ),
    ]
)

/**
 WARNING:
 
 This package shows only example principles of using real shared library written in Kotlin Multiplatform (KMP).
 Swift package KotlinMultiplatformLibrary was created just to simply demonstrate data flow and responsibilities between native iOS app and KMP shared library.
 
 */
