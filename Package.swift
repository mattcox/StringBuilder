// swift-tools-version: 6.0

import PackageDescription

let package = Package(
	name: "StringBuilder",
	platforms: [
		.macOS(.v10_15),
		.iOS(.v13),
		.tvOS(.v13),
		.watchOS(.v6),
		.macCatalyst(.v13)
	],
	products: [
		.library(
			name: "StringBuilder",
			targets: [
				"StringBuilder"
			]
		),
	],
	targets: [
		.target(
			name: "StringBuilder"
		),
		.testTarget(
			name: "StringBuilderTests",
			dependencies: [
				"StringBuilder"
			]
		),
	]
)
