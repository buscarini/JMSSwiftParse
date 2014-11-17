// Playground - noun: a place where people can play

import Foundation

func f<T,U>(value: U) -> T? {
	return value as? T
}

func f(value: Bool) -> Int? {
	return 1
}

func f(value: Int) -> Bool? {
	return true
}

func f(value: String) -> Bool? {
	return true
}

func downcast<T>(inout property: T?,value: AnyObject?) -> Bool {
	switch value {
	case let downcasted as Bool:
		property = f(downcasted)
		return true
	case let downcasted as String:
		property = f(downcasted)
		return true
	default:
		return false
	}
}

let rawString: AnyObject? = NSString(string: "blah")

var bool : Bool? = false
downcast(&bool,rawString)

