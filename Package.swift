// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Alchemy.swift",
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
  dependencies: [],
  targets: [
    .target(
      name: "Alchemy",
      dependencies: []),
    .testTarget(
      name: "AlchemyTests",
      dependencies: ["Alchemy"]),
  ]
)
