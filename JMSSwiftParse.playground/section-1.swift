// Playground - noun: a place where people can play

import UIKit


func convert<T,U>(value : T?) -> U? {
	if let converted = value as? U {
		return converted
	}
	return nil
}


func convert<T: BooleanLiteralConvertible>(value : String?) -> T? {
	if let string = value {
		let lowercase = string.lowercaseString
		if lowercase=="true" {
			return true
		}
		else if lowercase=="false" {
			return false
		}
	}
	return nil
}

func convert<T: BooleanLiteralConvertible>(value : String) -> T? {
	let lowercase = value.lowercaseString
	if lowercase=="true" {
		return true
	}
	else if lowercase=="false" {
		return false
	}
	
	return nil
}

public func parse<T,U>(inout property: T, value: U?) -> Bool {
	let converted : T? = convert(value)
	if let valid = converted {
		property = valid
		return true
	}
	
	return false
}

func parse<T: BooleanLiteralConvertible>(inout property: T, value: String?) -> T? {
	let converted : T? = convert(value)
	if let valid = converted {
		property = valid
		return true
	}
	
	return false
}
	
var available = false

parse(&available,"true")

available

