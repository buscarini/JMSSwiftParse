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

func convert<T,U>(value : T?) -> U? {
	if let converted = value as? U {
		return converted
	}
	return nil
}

/// MARK: Bool

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

func convert<T: BooleanLiteralConvertible>(value : T?) -> String? {
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

func convert<T: BooleanLiteralConvertible>(value : NSString?) -> T? {
	return convert(value as? String)
}

func convert<T: BooleanLiteralConvertible>(value : T?) -> NSString? {
	return convert(value)
}

func convert(value : NSNumber?) -> NSString? {
	if let number = value {
		return number.stringValue
	}
	return nil
}

func convert(value : NSString?) -> NSNumber? {
	if let string = value {
		return NSNumber(double: string.doubleValue)
	}
	return nil
}

func convert(value : NSNumber?) -> String? {
	if let number = value {
		return number.stringValue
	}
	return nil
}

func convert(value : String?) -> NSNumber? {
	if let string = value {
		if let num = string.toDouble() {
			return NSNumber(double: num)
		}
	}
	return nil
}


func convert(value : String?) -> NSURL? {
	if let string = value {
		return NSURL(string: string)
	}
	return nil
}

func convert(value : NSString?) -> NSURL? {
	return convert(value as String?)
}

func convert(value : NSURL?) -> String? {
	if let string = value {
		return string.absoluteString
	}
	return nil
}

func convert(value : NSURL?) -> NSString? {
	return convert(value) as NSString?
}
