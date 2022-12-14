// swift-tools-version: 5.5
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
            name: "FrontOfficeApi",
            dependencies: []),
        .testTarget(
            name: "FrontOfficeTests",
            dependencies: [.product(name: "XaynFrontOfficeSdk", package: "user_management")]
            )
    ]
)
