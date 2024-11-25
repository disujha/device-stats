// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "DeviceStats",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "DeviceStats",
            targets: ["devicePlugin"])
    ],
    dependencies: [
        .package(url: "https://github.com/ionic-team/capacitor-swift-pm.git", branch: "main")
    ],
    targets: [
        .target(
            name: "devicePlugin",
            dependencies: [
                .product(name: "Capacitor", package: "capacitor-swift-pm"),
                .product(name: "Cordova", package: "capacitor-swift-pm")
            ],
            path: "ios/Sources/devicePlugin"),
        .testTarget(
            name: "devicePluginTests",
            dependencies: ["devicePlugin"],
            path: "ios/Tests/devicePluginTests")
    ]
)