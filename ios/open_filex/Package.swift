// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "open_filex",
    platforms: [
        .iOS("13.0")
    ],
    products: [
        .library(name: "open-filex", targets: ["open_filex"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "open_filex",
            dependencies: [],
            cSettings: [
                .headerSearchPath("include/open_filex")
            ]
        )
    ]
)
