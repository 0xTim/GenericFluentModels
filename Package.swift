// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "GenericModels",
    // products: [
    //     .library(name: "Models", targets: ["Modes"]),
    // ],
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", .branch("beta")),
        .package(url: "https://github.com/vapor/fluent.git", .branch("beta")),
    ],
    targets: [
        .target(name: "Models", dependencies: ["Vapor"]),
        .target(name: "FluentModels", dependencies: ["Models", "Fluent", "FluentSQLite"]),
        .target(name: "App", dependencies: ["Vapor", "FluentModels", "FluentSQLite"]),
        .target(name: "Run", dependencies: ["App"]),
        .testTarget(name: "AppTests", dependencies: ["App"]),
    ]
)
