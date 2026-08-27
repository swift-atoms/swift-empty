// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-empty",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(
            name: "Empty",
            targets: ["Empty"]
        ),
        .library(
            name: "Empty Standard Library Integration",
            targets: ["Empty Standard Library Integration"]
        ),
        .library(
            name: "Empty Apple Foundation Integration",
            targets: ["Empty Apple Foundation Integration"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Empty",
            dependencies: []
        ),
        .target(
            name: "Empty Standard Library Integration",
            dependencies: ["Empty"]
        ),
        .target(
            name: "Empty Apple Foundation Integration",
            dependencies: [
                "Empty",
                "Empty Standard Library Integration",
            ]
        ),
        .testTarget(
            name: "Empty Tests",
            dependencies: ["Empty"]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
