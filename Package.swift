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
        .library(name: "Empty", targets: ["Empty"]),

        .library(name: "Empty Foundation Integration", targets: ["Empty Foundation Integration"]),
        .library(name: "Empty Test Support", targets: ["Empty Test Support"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Empty",
            dependencies: [
            ],
            path: "Sources/Empty"
        ),
        
        .target(
            name: "Empty Foundation Integration",
            dependencies: [
                .target(name: "Empty"),
            ],
            path: "Sources/Empty Foundation Integration"
        ),
        .target(
            name: "Empty Test Support",
            dependencies: [
                .target(name: "Empty"),
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "Empty Tests",
            dependencies: [
                .target(name: "Empty"),
                .target(name: "Empty Test Support"),
                .target(name: "Empty Foundation Integration"),
            ],
            path: "Tests/Empty Tests"
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets {
    target.swiftSettings = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]
}
