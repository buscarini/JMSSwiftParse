//
//  conversions.swift
//  JMSSwiftParse
//
//  Created by Jose Manuel Sánchez Peñarroja on 10/11/14.
//  Copyright (c) 2014 José Manuel Sánchez. All rights reserved.
//

import Foundation

extension String {
	func toDouble() -> Double? {
		return NSString(string: self).doubleValue
	}
}

func convert<T,U>(value : T) -> U? {
	return value as? U
}

/*
func convert<T,U>(value : T) -> U? {
	if let converted = value as? U {
		return converted
	}
	return nil
}
*/

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

// MARK: Bool <-> NSNumber

func convert(value : NSNumber) -> Bool? {
	return value.boolValue
}

func convert(value : Bool) -> NSNumber? {
	return NSNumber(bool: value)
}

// MARK: Bool <-> String

func convert(value : String) -> Bool? {
	let lowercase = value.lowercaseString
	if lowercase=="true" {
		return true
	}
	else if lowercase=="false" {
		return false
	}
	return nil
}

func convert(value : Bool) -> String? {
	if value {
		return "true"
	}
	return "false"
}

// MARK: Bool <-> NSString

func convert(value : NSString) -> Bool? {
	let lowercase = value.lowercaseString
	if lowercase=="true" {
		return true
	}
	else if lowercase=="false" {
		return false
	}
	return nil
}

func convert(value : Bool) -> NSString? {
	if value {
		return "true"
	}
	return "false"
}

// MARK: String <-> NSURL


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

// MARK: Int <-> NSNumber

func convert(value : NSNumber) -> Int? {
	return value.integerValue
}

func convert(value : Int) -> NSNumber? {
	return NSNumber(integer: value)
}

// MARK: Int <-> String

func convert(value : String) -> Int? {
	return NSString(string: value).integerValue
}

func convert(value : Int) -> String? {
	return value.description
}

// MARK: Int <-> NSString

func convert(value : NSString) -> Int? {
	return value.integerValue
}

func convert(value : Int) -> NSString? {
	return value.description
}

// MARK: NSDate <-> String

var cache = Cache()

//var cache = NSCache()

func cachedDateFormatter(format: String) -> NSDateFormatter {
	let cachedFormatter = cache.objectForKey(format)
	
	if let dateFormatter = cachedFormatter {
		return dateFormatter
	}
	else {
		let dateFormatter = NSDateFormatter()
		dateFormatter.dateFormat = format
		cache.setObject(dateFormatter, forKey: format)
		return dateFormatter
	}
}

func convert(value : String,format: String) -> NSDate? {
	let dateFormatter = cachedDateFormatter(format)
	return dateFormatter.dateFromString(value)
}

func convert(value : NSDate,format: String) -> String? {
	let dateFormatter = cachedDateFormatter(format)
	return dateFormatter.stringFromDate(value)
}


// MARK: AnyObject

/*func convert<T>(value: AnyObject?) -> T? {
	switch value {
	case let downcasted as T:
		return convert(downcasted)
	default:
		return nil
	}
}*/

//func downcast<T>(inout property: T,value: AnyObject) -> Bool {
//	switch value {
//		case let downcasted as Bool:
//			property = convert(downcasted)
//			return true
//		case let downcasted as Int:
//			property = convert(downcasted)
//			return true
//		case let downcasted as Float:
//			property = convert(downcasted)
//			return true
//		default:
//			return false
//	}
//}

//func downcast<T>(property: T,value: AnyObject?) -> T? {
//	switch value {
//	case let downcasted as T:
//		return downcasted
//	default:
//		return nil
//	}
//}


func downcast<T>(inout property: T?,value: AnyObject?) -> Bool {
	switch value {
		case let downcasted as Bool:
			property = convert(downcasted)
		case let downcasted as Int:
			property = convert(downcasted)
		case let downcasted as String:
			property = convert(downcasted)
		case let downcasted as NSString:
			property = convert(downcasted)
		case let downcasted as NSDate:
			property = convert(downcasted)
		case let downcasted as NSURL:
			property = convert(downcasted)
		default:
			return false
	}
	
	return property.hasValue
}

func downcast<T>(inout property: T,value: AnyObject?) -> Bool {
	var optionalProperty : T?
	switch value {
		case let downcasted as Bool:
			optionalProperty = convert(downcasted)
		case let downcasted as Int:
			optionalProperty = convert(downcasted)
		case let downcasted as String:
			optionalProperty = convert(downcasted)
		case let downcasted as NSString:
			optionalProperty = convert(downcasted)
		case let downcasted as NSDate:
			optionalProperty = convert(downcasted)
		case let downcasted as NSURL:
			optionalProperty = convert(downcasted)
		default:
			return false
	}

	if let converted = optionalProperty {
		property = converted
		return true
	}
	
	return false
}

func downcast(inout property: NSDate?,value: AnyObject?,format: String) -> Bool {
	switch value {
		case let downcasted as Bool:
			property = convert(downcasted, format)
		case let downcasted as Int:
			property = convert(downcasted, format)
		case let downcasted as String:
			property = convert(downcasted, format)
		case let downcasted as NSString:
			property = convert(downcasted, format)
		case let downcasted as NSDate:
			property = convert(downcasted, format)
		case let downcasted as NSURL:
			property = convert(downcasted, format)
		default:
			return false
	}
	
	return property.hasValue
}

