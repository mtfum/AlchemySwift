// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "AlchemySwift",
  platforms: [
    .iOS(.v15),
    .macOS(.v12),
    .tvOS(.v15),
    .watchOS(.v8)
  ],
  products: [
    .library(
      name: "Alchemy",
      targets: ["Alchemy"]),
  ],
  dependencies: [
    .package(url: "https://github.com/Flight-School/AnyCodable", from: "0.6.5")
  ],
  targets: [
    .target(
      name: "Alchemy",
      dependencies: [
        .product(name: "AnyCodable", package: "AnyCodable")
      ]),
    .testTarget(
      name: "AlchemyTests",
      dependencies: ["Alchemy"]),
  ]
)
