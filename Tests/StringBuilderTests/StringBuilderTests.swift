//
//  StringBuilderTests.swift
//  StringBuilder
//
//  Created by Matt Cox on 13/08/2024.
//  Copyright © 2024 Matt Cox. All rights reserved.
//

import Foundation
import Testing
@testable import StringBuilder

/// Tests basic string building.
///
/// The input to the string builder is two strings, and the output should be a
/// single string with two lines of text.
///
@Test("Test basic string building")
func testBasicString() throws {
	let built = String {
		"Line 1"
		"Line 2"
	}
	
	let compare = """
	Line 1
	Line 2
	"""
	
	#expect(built == compare)
}

/// Tests basic string building.
///
/// The input to the string builder is two strings, and the output should be a
/// single string on one line, joining the two strings with a custom separator.
///
@Test("Test basic string building with custom separator")
func testBasicStringWithCustomSeparator() throws {
	let built = String(separator: "~") {
		"Word 1"
		"Word 2"
	}
	
	let compare = "Word 1~Word 2"
	
	#expect(built == compare)
}

/// Test inserting blank lines into a string.
///
/// The input to the string builder is three strings, the second of which is
/// empty, and the output should be a single string containing three lines, the
/// second of which is empty.
///
@Test("Test blank lines")
func testBlankLines() throws {
	let built = String {
		"Line 1"
		""
		"Line 3"
	}
	
	let compare = """
	Line 1
	
	Line 3
	"""
	
	#expect(built == compare)
}

/// Test nested string builders.
///
/// Some of the string builders have custom separators to control how the
/// strings inside each string builder are joined together.
///
@Test("Test nested string builders")
func testNestedStringBuilders() throws {
	let built = String {
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
	
	let compare = """
	One
	Two.Three
	Four
	Five
	Six
	
	Seven
	Eight
	Nine
	Ten
	"""
	
	#expect(built == compare)
}

/// Test building strings from non-string types.
///
/// Any type that conforms to `CustomStringConvertible` should work here.
///
@Test("Test building string from convertible types")
func testConvertibleTypes() throws {
	let uuid = UUID()
	
	let built = String {
		uuid
		123
		true
	}
	
	let compare = """
	\(uuid.description)
	\(123)
	\(true)
	"""
	
	#expect(built == compare)
}

/// Test building a string from an optional value.
///
@Test("Test building string from optional value")
func testOptional() throws {
	let value: String? = "Value"
	
	let built = String {
		if let value {
			value
		}
	}
	
	let compare = "Value"
	
	#expect(built == compare)
}
