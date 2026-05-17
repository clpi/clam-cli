// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "clam-cli",
    platforms: [.macOS(.v15), .iOS(.v18), .tvOS(.v18)],
    products: [
        .executable(name: "clam-cli", targets: ["clam-cli"]),
        .library(name: "clam", targets: ["clam"])
    ],
    dependencies: [
        .package(url: "https://github.com/ml-explore/mlx-swift", branch: "main"),
        .package(url: "https://github.com/ml-explore/mlx-swift-lm", branch: "main"),
        .package(url: "https://github.com/huggingface/swift-transformers", .upToNextMajor(from: "1.3.0")),
        .package(url: "https://github.com/hummingbird-project/hummingbird.git", from: "2.19.0"),
        .package(url: "https://github.com/hummingbird-project/hummingbird-auth.git", from: "1.0.0"),
        .package(url: "https://github.com/hummingbird-project/swift-jobs.git", from: "1.3.0"),
        // .package(url: "https://github.com/hummingbird-project/swift-jobs-valkey.git", from: "1.3.0"),
        .package(url: "https://github.com/hummingbird-project/hummingbird-core.git", from: "1.0.0"),
        .package(url: "https://github.com/apple/swift-configuration.git", .upToNextMajor(from: "1.0.0"), traits: [.defaults, "CommandLineArguments"]),
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.4.0"),
        .package(url: "https://github.com/apple/swift-log", from: "1.0.0"),
        // .package(url: "https://github.com/swiftlang/swift-syntax", from: "1.0.0"),

    ],
    targets: [
        .systemLibrary(
            name: "clam",
            path: "Sources/clam",
        ),
        .target(
            name: "clam-cli",
            dependencies: [
                "MLXInferenceCore",
                "DFlash",
                .product(name: "MLX", package: "mlx-swift"),
                .product(name: "MLXLLM", package: "mlx-swift-lm"),
                .product(name: "MLXVLM", package: "mlx-swift-lm"),
                .product(name: "MLXLMCommon", package: "mlx-swift-lm"),
                .product(name: "MLXHuggingFace", package: "mlx-swift-lm"),
                // .product(name: "Transformers", package: "swift-transformers"),
                .product(name: "HummingbirdBasicAuth", package: "hummingbird-auth"),
                .product(name: "HummingbirdBcrypt", package: "hummingbird-auth"),

                .product(name: "Hummingbird", package: "hummingbird"),
                .product(name: "HummingbirdRouter", package: "hummingbird"),
                .product(name: "HummingbirdAuth", package: "hummingbird-auth"),
                .product(name: "HummingbirdCore", package: "hummingbird-core"),
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ],
            path: "Sources/clam-cli",
            exclude: [],
            sources: [],
            resources: [],
            cSettings: [],
            swiftSettings: [],
            plugins: [],
        ),
        .testTarget(
            name: "clam-cliTests",
            dependencies: ["clam-cli", "clam"]
        ),
    ],
    swiftLanguageModes: [.v6]
)
