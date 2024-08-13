# StringBuilder

<p align="center">
    <img src="https://img.shields.io/badge/Swift-orange.svg" alt="Swift" />
    <a href="https://swift.org/package-manager">
        <img src="https://img.shields.io/badge/swiftpm-compatible-brightgreen.svg?style=flat" alt="Swift Package Manager" />
    </a>
</p>

Welcome to **StringBuilder**, a Swift package for dynamically building strings
using a `resultBuilder`.

## Usage

### Basic String Building
To build a basic multi-line string:
```swift
String {
	"Line 1"
	"Line 2"
}
```

Becomes...
```swift
"""
Line 1
Line 2
"""
```

### Custom Separator
A custom separator can be used to control how the strings are joined:
```swift
String(separator: " != ") {
	"String 1"
	"String 2"
}
```

Becomes...
```swift
"String 1 != String 2"
```

### String Convertible Types
Any type that conforms to `CustomStringConvertible` can be added to the
string builder:
```swift
String {
	1234
	true
	UUID()
}
```

Becomes...
```swift
1234
true
3D5E76E1-CB1D-4FEF-A5CA-3C67AA08BF47
```

### Nested String Builders
String builders can be nested with different separators at each level:
```swift
String {
	"One"
	
	String(separator: ".") {
		"Two"
		"Three"
	}
	
	"Four"
	
	String {
		String {
			"Five"
			
			String(separator: "\n\n") {
				"Six"
				"Seven"
			}
			
			"Eight"
		}
		
		"Nine"
	}
	
	"Ten"
}
```

Becomes...
```swift
One
Two.Three
Four
Five
Six

Seven
Eight
Nine
Ten
```

## Installation

StringBuilder is distributed using the [Swift Package Manager](https://swift.org/package-manager). To install it within another Swift package, add it as a dependency within your `Package.swift` manifest:

```swift
let package = Package(
    // . . .
    dependencies: [
        .package(url: "https://github.com/mattcox/StringBuilder.git", branch: "main")
    ],
    // . . .
)
```

If you’d like to use StringBuilder within an iOS, macOS, watchOS or tvOS app, then use Xcode’s `File > Add Packages...` menu command to add it to your project.

Import `StringBuilder` wherever you’d like to use it:
```swift
import StringBuilder
```
