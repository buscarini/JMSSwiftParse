//
//  JMSSwiftParse.swift
//  JMSSwiftParse
//
//  Created by Jose Manuel Sánchez Peñarroja on 10/11/14.
//  Copyright (c) 2014 José Manuel Sánchez. All rights reserved.
//

import Foundation

/// MARK: Conversions

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

/// MARK: Validators


/// MARK: Size
func equal<T: Equatable>(min : T) -> (T) -> Bool {
	return { $0==min }
}

//func different<T: Equatable>(min : T) -> (T) -> Bool {
//	return { $0!=min }
//}

func smallerThan<T: Comparable>(min : T) -> (T) -> Bool {
	return { $0<min }
}

func smallerThanOrEqual<T: Comparable>(min : T) -> (T) -> Bool {
	return { $0<=min }
}

func greaterThan<T: Comparable>(min : T) -> (T) -> Bool {
	return { $0>min }
}

func greaterThanOrEqual<T: Comparable>(min : T) -> (T) -> Bool {
	return { $0>=min }
}


/// MARK: Length

func compareLength(length: Int, operation: (Int,Int) -> Bool ) -> (String) -> Bool {
	return { operation($0.lengthOfBytesUsingEncoding(NSUTF8StringEncoding),length) }
}

func compareLength(length: Int, operation: (Int,Int) -> Bool ) -> (NSString) -> Bool {
	return { operation($0.length,length) }
}

func longerThan(length: Int) -> (String) -> Bool {
	return compareLength(length, >)
}

func longerThanOrEqual(length: Int) -> (String) -> Bool {
	return compareLength(length, >=)
}

func shorterThan(length: Int) -> (String) -> Bool {
	return compareLength(length, <)
}

func shorterThanOrEqual(length: Int) -> (String) -> Bool {
	return compareLength(length, <=)
}

func longerThan(length: Int) -> (NSString) -> Bool {
	return compareLength(length, >)
}

func longerThanOrEqual(length: Int) -> (NSString) -> Bool {
	return compareLength(length, >=)
}

func shorterThan(length: Int) -> (NSString) -> Bool {
	return compareLength(length, <)
}

func shorterThanOrEqual(length: Int) -> (NSString) -> Bool {
	return compareLength(length, <=)
}

/// MARK : Semantics

func isEmail() -> (NSString) -> Bool {
	let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
	return {
		(string) in
		let emailTestPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
		if let predicate = emailTestPredicate {
			return predicate.evaluateWithObject(string)
		}
		return false
	}
}


/// MARK: Function operators

func &&<T>(lhs: (T) -> Bool,rhs : (T) -> Bool) -> (T) -> Bool {
	return {
		(val) in
		if !lhs(val){
			return false
		}
		return rhs(val)
	}
}

func ||<T>(lhs: (T) -> Bool,rhs : (T) -> Bool) -> (T) -> Bool {
	return {
		(val) in
		if lhs(val){
			return true
		}
		return rhs(val)
	}
}

prefix func !<T>(validator: (T) -> Bool) -> (T) -> Bool {
	return { !validator($0) }
}

/// MARk: Parsers

func parse<T>(inout property: T, value: AnyObject?,validate: (T)->Bool) -> Bool {
	if let converted : T = convert(value) {
		if validate(converted) {
			property = converted
			return true
		}
	}
	
	return false
}

func parse<T>(inout property: T, value: AnyObject?) -> Bool {
	return parse(&property, value) { (val) in true }
}

