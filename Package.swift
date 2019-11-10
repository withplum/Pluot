// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Pluot",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "Pluot",
            targets: ["Pluot"]),
    ],
    targets: [
        .target(
            name: "Pluot",
            dependencies: [],
            path: "Pluoa"),
        .testTarget(
            name: "PluotTests",
            dependencies: ["Pluot"],
            path: "PluotTests"),
    ]
)
