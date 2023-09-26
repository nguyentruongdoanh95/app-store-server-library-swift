// swift-tools-version: 5.7
// Copyright (c) 2023 Apple Inc. Licensed under MIT License.

import PackageDescription


let package = Package(
    name: "AppStoreServerLibrary",
    platforms: [
        .macOS(.v11),
        .iOS(.v13),
        .watchOS(.v6),
        .tvOS(.v13),
    ],
    products: [
        .library(
            name: "AppStoreServerLibrary",
            targets: ["AppStoreServerLibrary"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-certificates.git", .upToNextMinor(from: "0.5.0")),
        .package(url: "https://github.com/apple/swift-asn1.git", .upToNextMinor(from: "0.8.0")),
        .package(url: "https://github.com/apple/swift-crypto.git", "1.0.0" ..< "3.0.0"),
        .package(url: "https://github.com/vapor/jwt-kit.git", from: "4.0.0"),
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "AppStoreServerLibrary",
            dependencies: [
                .product(name: "X509", package: "swift-certificates"),
                .product(name: "Crypto", package: "swift-crypto"),
                .product(name: "SwiftASN1", package: "swift-asn1"),
                .product(name: "JWTKit", package: "jwt-kit")
            ]),
        .testTarget(
            name: "AppStoreServerLibraryTests",
            dependencies: ["AppStoreServerLibrary"]),
    ]
)
