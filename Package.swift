// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OpenGLAD",
    products: [
        .library(
            name: "OpenGLAD",
            targets: [
                "OpenGLAD"
            ]
        )
    ],
    targets: [
        .target(
            name: "OpenGLAD"
        )
    ]
)
