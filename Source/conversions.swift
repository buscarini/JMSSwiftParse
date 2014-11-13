//
//  conversions.swift
//  JMSSwiftParse
//
//  Created by Jose Manuel Sánchez Peñarroja on 10/11/14.
//  Copyright (c) 2014 José Manuel Sánchez. All rights reserved.
//

import Foundation
import Swift

extension String {
	func toDouble() -> Double? {
		return NSString(string: self).doubleValue
	}
}

/*
public protocol Convertible {}

extension Int : Convertible {}
extension Bool : Convertible {}
extension String : Convertible {}
extension NSInteger : Convertible {}
extension NSNumber : Convertible {}
extension NSString : Convertible {}
extension NSURL : Convertible {}

func convert<T: Convertible,U: Convertible>(value : T) -> U? {
	if let converted = value as? U {
		return converted
	}
	return nil
}

// MARK: Bool

func convert<T: BooleanLiteralConvertible>(string : String) -> T? {
	let lowercase = string.lowercaseString
	if lowercase=="true" {
		return true
	}
	else if lowercase=="false" {
		return false
	}
	return nil
}

func convert<T: BooleanLiteralConvertible>(value : T) -> String? {
	if let boolValue = value as? Bool {
		if boolValue {
			return "true"
		}
		else {
			return "false"
		}
	}
	return nil
}

func convert<T: BooleanLiteralConvertible>(value : NSString) -> T? {
	return convert(value as String)
}

func convert<T: BooleanLiteralConvertible>(value : T) -> NSString? {
	return convert(value)
}

*/

// MARK: NSNumber <-> String
/*
func convert(number : NSNumber) -> NSString? {
	return number.stringValue
}

func convert(string : NSString) -> NSNumber? {
	return NSNumber(double: string.doubleValue)
}

func convert(number : NSNumber) -> String? {
	return number.stringValue
}

func convert(string : String) -> NSNumber? {
	if let num = string.toDouble() {
		return NSNumber(double: num)
	}
	return nil
}*/

// MARK: String <-> NSURL
/*

func convert(string : String) -> NSURL? {
	return NSURL(string: string)
}

func convert(value : NSString) -> NSURL? {
	return convert(value as String)
}

func convert(url : NSURL) -> String? {
	return url.absoluteString
}

func convert(value : NSURL) -> NSString? {
	return convert(value) as NSString?
}
*/
// MARK: Int <-> String

//func convert<T: IntegerType>(string : String) -> T? {
//	let oldString = NSString(string: string)
//	return oldString.integerValue as? T
//}
//
//func convert<T: IntegerType>(value : T) -> String? {
//	return value.description
//}
