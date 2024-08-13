//
//  String+StringBuilder.swift
//  StringBuilder
//
//  Created by Matt Cox on 13/08/2024.
//  Copyright © 2024 Matt Cox. All rights reserved.
//

extension String {
/// Initialize a String from multiple Strings or string convertible types.
///
/// A result builder allows the string to be composed from multiple types,
/// and a separator can be specified to control how the strings are joined
/// together.
///
/// - Parameters:
///   - separator: The separator to insert between each string. This
///   defaults to a new line.
///   - contents: A result builder that will be called to populate the
///   string.
///
/// **Example**
/// ```swift
/// String(separator: "\n\n") {
///     "String"
///     1234
///     true
/// }
///
/// // String
/// //
/// // 1234
/// //
/// // true
/// ```
///
	public init(separator: String = "\n", @StringBuilder _ contents: () -> [String]) {
		self = contents().joined(separator: separator)
	}
}
