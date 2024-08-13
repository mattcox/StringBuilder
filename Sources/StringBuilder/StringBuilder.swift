//
//  StringBuilder.swift
//  StringBuilder
//
//  Created by Matt Cox on 13/08/2024.
//  Copyright © 2024 Matt Cox. All rights reserved.
//

@resultBuilder
public enum StringBuilder {
	public static func buildBlock() -> String {
		""
	}
}

public extension StringBuilder {
	static func buildPartialBlock(first: CustomStringConvertible) -> [String] {
		[first.description]
	}
	
	static func buildPartialBlock(accumulated: [String], next: CustomStringConvertible) -> [String] {
		accumulated + [next.description]
	}
	
	static func buildPartialBlock(first: String) -> [String] {
		[first]
	}
	
	static func buildPartialBlock(accumulated: [String], next: String) -> [String] {
		accumulated + [next]
	}
	
	static func buildPartialBlock(first: [String]) -> [String] {
		first
	}
	
	static func buildPartialBlock(accumulated: [String], next: [String]) -> [String] {
		accumulated + next
	}
}

public extension StringBuilder {
	static func buildOptional(_ component: [String]?) -> [String] {
		component ?? []
	}
}

public extension StringBuilder {
	static func buildEither(first component: [String]) -> [String] {
		component
	}
	
	static func buildEither(second component: [String]) -> [String] {
		component
	}
}

public extension StringBuilder {
	static func buildArray(_ components: [[String]]) -> [String] {
		components.flatMap {
			$0
		}
	}
}
