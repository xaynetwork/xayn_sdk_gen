// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "test",
    platforms: [.macOS(.v12)],
    dependencies: [
        .package(url: "../", from: "1.0.0")
        ],
    targets: [
        .target(
            name: "DocumentApi",
            dependencies: []),
        .testTarget(
            name: "DocumentTests",
            dependencies: [.product(name: "OpenAPIClient", package: "document_management")]
            )
    ]
)
