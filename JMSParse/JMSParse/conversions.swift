//
//  conversions.swift
//  JMSParse
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

func convert<T,U>(value : T?) -> U? {
	if let converted = value as? U {
		return converted
	}
	return nil
}

func convert(value : Int?) -> NSString? {
	if let number = value {
		return NSString(format: "%d", number)
	}
	return nil
}

func convert(value : Int?) -> String? {
	if let number = value {
		return String(format: "%d", number)
	}
	return nil
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

func convert(value : String?) -> Bool? {
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

func convert(value : NSString?) -> Bool? {
	return convert(value as String?)
}

