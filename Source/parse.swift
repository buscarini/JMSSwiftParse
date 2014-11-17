//
//  JMSSwiftParse.swift
//  JMSSwiftParse
//
//  Created by Jose Manuel Sánchez Peñarroja on 10/11/14.
//  Copyright (c) 2014 José Manuel Sánchez. All rights reserved.
//

import Foundation

// MARK: Generic Parsers

/*
public func parse<T,U>(inout property: T, value: U,validate: (T)->Bool = { (val) in true }) -> Bool {
	let converted : T? = convert(value)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	return false
}

public func parse<T,U>(inout property: T?, value: U,validate: (T)->Bool = { (val) in true }) -> Bool {
	let converted : T? = convert(value)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	return false
}

public func parse<T,U>(inout property: T, value: U?,validate: (T)->Bool = { (val) in true }) -> Bool {
	if let validValue : U = value {
		return parse(&property, validValue, validate: validate)
	}
	return false
}

public func parse<T,U>(inout property: T?, value: U?,validate: (T)->Bool = { (val) in true }) -> Bool {
	if let validValue : U = value {
		return parse(&property, validValue, validate: validate)
	}
	return false
}
*/



/*public func parse<T>(inout property: T, value: T,validate: (T)->Bool = { (val) in true }) -> Bool {
	if validate(value) {
		property = value
		return true
	}
	return false
}*/

// MARK: T <-> AnyObject

public func parse<T>(inout property: T?, value: AnyObject,validate: (T)->Bool) -> Bool {
	let converted : T? = convert(value)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	return false
}

public func parse<T>(inout property: T?, value: AnyObject) -> Bool {
	let converted : T? = convert(value)
	if let valid = converted {
		property = valid
		return true
	}
	return false
}

public func parse<T>(inout property: T, value: AnyObject,validate: (T)->Bool) -> Bool {
	let converted : T? = convert(value)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	return false
}

public func parse<T>(inout property: T, value: AnyObject) -> Bool {
	let converted : T? = convert(value)
	if let valid = converted {
		property = valid
		return true
	}
	return false
}

public func parse<T>(inout property: T?, value: AnyObject?,validate: (T)->Bool) -> Bool {
	if let validValue : AnyObject = value {
		let converted : T? = convert(validValue)
		if let valid = converted {
			if validate(valid) {
				property = valid
				return true
			}
		}
	}
	return false
}

public func parse<T>(inout property: T?, value: AnyObject?) -> Bool {
	if let validValue : AnyObject = value {
		let converted : T? = convert(validValue)
		if let valid = converted {
			property = valid
			return true
		}
	}
	return false
}

public func parse<T>(inout property: T, value: AnyObject?,validate: (T)->Bool) -> Bool {
	if let validValue : AnyObject = value {
		let converted : T? = convert(validValue)
		if let valid = converted {
			if validate(valid) {
				property = valid
				return true
			}
		}
	}
	return false
}

public func parse<T>(inout property: T, value: AnyObject?) -> Bool {
	if let validValue : AnyObject = value {
		let converted : T? = convert(validValue)
		if let valid = converted {
			property = valid
			return true
		}
	}
	return false
}

// MARK: T <- NSNull

public func parse<T>(inout property: T, value: NSNull) -> Bool {
	return false
}

public func parse<T>(inout property: T?, value: NSNull) -> Bool {
	property = nil
	return true
}

// MARK: T <-> T

public func parse<T>(inout property: T, value: T?,validate: (T)->Bool) -> Bool {
	if let valid = value {
		if validate(valid) {
			property = valid
			return true
		}
	}
	return false
}

public func parse<T>(inout property: T?, value: T?,validate: (T)->Bool) -> Bool {
	if let valid = value {
		if validate(valid) {
			property = valid
			return true
		}
	}
	return false
}

public func parse<T>(inout property: T, value: T?) -> Bool {
	if let valid = value {
		property = valid
		return true
	}
	return false
}

public func parse<T>(inout property: T?, value: T?) -> Bool {
	if let valid = value {
		property = valid
		return true
	}
	return false
}


// MARK: Specific methods, required while they fix Swift bugs


// MARK: NSURL -> String

public func parse(inout property: String?, value: NSURL,validate: (String)->Bool) -> Bool {
	let converted : String? = convert(value)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	return false
}

public func parse(inout property: String?, value: NSURL) -> Bool {
	let converted : String? = convert(value)
	if let valid = converted {
		property = valid
		return true
	}
	return false
}

public func parse(inout property: String, value: NSURL,validate: (String)->Bool) -> Bool {
	let converted : String? = convert(value)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	return false
}

public func parse(inout property: String, value: NSURL) -> Bool {
	let converted : String? = convert(value)
	if let valid = converted {
		property = valid
		return true
	}
	return false
}

public func parse(inout property: String?, value: NSURL?,validate: (String)->Bool) -> Bool {
	if let validValue = value {
		let converted : String? = convert(validValue)
		if let valid = converted {
			if validate(valid) {
				property = valid
				return true
			}
		}
	}
	return false
}

public func parse(inout property: String?, value: NSURL?) -> Bool {
	if let validValue = value {
		let converted : String? = convert(validValue)
		if let valid = converted {
			property = valid
			return true
		}
	}
	return false
}

public func parse(inout property: String, value: NSURL?,validate: (String)->Bool) -> Bool {
	if let validValue = value {
		let converted : String? = convert(validValue)
		if let valid = converted {
			if validate(valid) {
				property = valid
				return true
			}
		}
	}
	return false
}

public func parse(inout property: String, value: NSURL?) -> Bool {
	if let validValue = value {
		let converted : String? = convert(validValue)
		if let valid = converted {
			property = valid
			return true
		}
	}
	return false
}

// MARK: String -> NSURL

public func parse(inout property: NSURL?, value: String,validate: (NSURL)->Bool) -> Bool {
	let converted : NSURL? = convert(value)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	return false
}

public func parse(inout property: NSURL?, value: String) -> Bool {
	let converted : NSURL? = convert(value)
	if let valid = converted {
		property = valid
		return true
	}
	return false
}

public func parse(inout property: NSURL, value: String,validate: (NSURL)->Bool) -> Bool {
	let converted : NSURL? = convert(value)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	return false
}

public func parse(inout property: NSURL, value: String) -> Bool {
	let converted : NSURL? = convert(value)
	if let valid = converted {
		property = valid
		return true
	}
	return false
}

public func parse(inout property: NSURL?, value: String?,validate: (NSURL)->Bool) -> Bool {
	if let validValue = value {
		let converted : NSURL? = convert(validValue)
		if let valid = converted {
			if validate(valid) {
				property = valid
				return true
			}
		}
	}
	return false
}

public func parse(inout property: NSURL?, value: String?) -> Bool {
	if let validValue = value {
		let converted : NSURL? = convert(validValue)
		if let valid = converted {
			property = valid
			return true
		}
	}
	return false
}

public func parse(inout property: NSURL, value: String?,validate: (NSURL)->Bool) -> Bool {
	if let validValue = value {
		let converted : NSURL? = convert(validValue)
		if let valid = converted {
			if validate(valid) {
				property = valid
				return true
			}
		}
	}
	return false
}

public func parse(inout property: NSURL, value: String?) -> Bool {
	if let validValue = value {
		let converted : NSURL? = convert(validValue)
		if let valid = converted {
			property = valid
			return true
		}
	}
	return false
}

// MARK: Bool -> NSNumber

public func parse(inout property: NSNumber?, value: Bool,validate: (NSNumber)->Bool) -> Bool {
	let converted : NSNumber? = convert(value)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	return false
}

public func parse(inout property: NSNumber?, value: Bool) -> Bool {
	let converted : NSNumber? = convert(value)
	if let valid = converted {
		property = valid
		return true
	}
	return false
}

public func parse(inout property: NSNumber, value: Bool,validate: (NSNumber)->Bool) -> Bool {
	let converted : NSNumber? = convert(value)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	return false
}

public func parse(inout property: NSNumber, value: Bool) -> Bool {
	let converted : NSNumber? = convert(value)
	if let valid = converted {
		property = valid
		return true
	}
	return false
}

public func parse(inout property: NSNumber?, value: Bool?,validate: (NSNumber)->Bool) -> Bool {
	if let validValue = value {
		let converted : NSNumber? = convert(validValue)
		if let valid = converted {
			if validate(valid) {
				property = valid
				return true
			}
		}
	}
	return false
}

public func parse(inout property: NSNumber?, value: Bool?) -> Bool {
	if let validValue = value {
		let converted : NSNumber? = convert(validValue)
		if let valid = converted {
			property = valid
			return true
		}
	}
	return false
}

public func parse(inout property: NSNumber, value: Bool?,validate: (NSNumber)->Bool) -> Bool {
	if let validValue = value {
		let converted : NSNumber? = convert(validValue)
		if let valid = converted {
			if validate(valid) {
				property = valid
				return true
			}
		}
	}
	return false
}

public func parse(inout property: NSNumber, value: Bool?) -> Bool {
	if let validValue = value {
		let converted : NSNumber? = convert(validValue)
		if let valid = converted {
			property = valid
			return true
		}
	}
	return false
}

// MARK: NSNumber -> Bool

public func parse(inout property: Bool?, value: NSNumber,validate: (Bool)->Bool) -> Bool {
	let converted : Bool? = convert(value)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	return false
}

public func parse(inout property: Bool?, value: NSNumber) -> Bool {
	let converted : Bool? = convert(value)
	if let valid = converted {
		property = valid
		return true
	}
	return false
}

public func parse(inout property: Bool, value: NSNumber,validate: (Bool)->Bool) -> Bool {
	let converted : Bool? = convert(value)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	return false
}

public func parse(inout property: Bool, value: NSNumber) -> Bool {
	let converted : Bool? = convert(value)
	if let valid = converted {
		property = valid
		return true
	}
	return false
}

public func parse(inout property: Bool?, value: NSNumber?,validate: (Bool)->Bool) -> Bool {
	if let validValue = value {
		let converted : Bool? = convert(validValue)
		if let valid = converted {
			if validate(valid) {
				property = valid
				return true
			}
		}
	}
	return false
}

public func parse(inout property: Bool?, value: NSNumber?) -> Bool {
	if let validValue = value {
		let converted : Bool? = convert(validValue)
		if let valid = converted {
			property = valid
			return true
		}
	}
	return false
}

public func parse(inout property: Bool, value: NSNumber?,validate: (Bool)->Bool) -> Bool {
	if let validValue = value {
		let converted : Bool? = convert(validValue)
		if let valid = converted {
			if validate(valid) {
				property = valid
				return true
			}
		}
	}
	return false
}

public func parse(inout property: Bool, value: NSNumber?) -> Bool {
	if let validValue = value {
		let converted : Bool? = convert(validValue)
		if let valid = converted {
			property = valid
			return true
		}
	}
	return false
}


// MARK: Bool -> String

public func parse(inout property: String?, value: Bool,validate: (String)->Bool) -> Bool {
	let converted : String? = convert(value)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	return false
}

public func parse(inout property: String?, value: Bool) -> Bool {
	let converted : String? = convert(value)
	if let valid = converted {
		property = valid
		return true
	}
	return false
}

public func parse(inout property: String, value: Bool,validate: (String)->Bool) -> Bool {
	let converted : String? = convert(value)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	return false
}

public func parse(inout property: String, value: Bool) -> Bool {
	let converted : String? = convert(value)
	if let valid = converted {
		property = valid
		return true
	}
	return false
}

public func parse(inout property: String?, value: Bool?,validate: (String)->Bool) -> Bool {
	if let validValue = value {
		let converted : String? = convert(validValue)
		if let valid = converted {
			if validate(valid) {
				property = valid
				return true
			}
		}
	}
	return false
}

public func parse(inout property: String?, value: Bool?) -> Bool {
	if let validValue = value {
		let converted : String? = convert(validValue)
		if let valid = converted {
			property = valid
			return true
		}
	}
	return false
}

public func parse(inout property: String, value: Bool?,validate: (String)->Bool) -> Bool {
	if let validValue = value {
		let converted : String? = convert(validValue)
		if let valid = converted {
			if validate(valid) {
				property = valid
				return true
			}
		}
	}
	return false
}

public func parse(inout property: String, value: Bool?) -> Bool {
	if let validValue = value {
		let converted : String? = convert(validValue)
		if let valid = converted {
			property = valid
			return true
		}
	}
	return false
}

// MARK: String -> Bool

public func parse(inout property: Bool?, value: String,validate: (Bool)->Bool) -> Bool {
	let converted : Bool? = convert(value)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	return false
}

public func parse(inout property: Bool?, value: String) -> Bool {
	let converted : Bool? = convert(value)
	if let valid = converted {
		property = valid
		return true
	}
	return false
}

public func parse(inout property: Bool, value: String,validate: (Bool)->Bool) -> Bool {
	let converted : Bool? = convert(value)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	return false
}

public func parse(inout property: Bool, value: String) -> Bool {
	let converted : Bool? = convert(value)
	if let valid = converted {
		property = valid
		return true
	}
	return false
}

public func parse(inout property: Bool?, value: String?,validate: (Bool)->Bool) -> Bool {
	if let validValue = value {
		let converted : Bool? = convert(validValue)
		if let valid = converted {
			if validate(valid) {
				property = valid
				return true
			}
		}
	}
	return false
}

public func parse(inout property: Bool?, value: String?) -> Bool {
	if let validValue = value {
		let converted : Bool? = convert(validValue)
		if let valid = converted {
			property = valid
			return true
		}
	}
	return false
}

public func parse(inout property: Bool, value: String?,validate: (Bool)->Bool) -> Bool {
	if let validValue = value {
		let converted : Bool? = convert(validValue)
		if let valid = converted {
			if validate(valid) {
				property = valid
				return true
			}
		}
	}
	return false
}

public func parse(inout property: Bool, value: String?) -> Bool {
	if let validValue = value {
		let converted : Bool? = convert(validValue)
		if let valid = converted {
			property = valid
			return true
		}
	}
	return false
}

// MARK: Int -> NSNumber

public func parse(inout property: NSNumber?, value: Int,validate: (NSNumber)->Bool) -> Bool {
	let converted : NSNumber? = convert(value)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	return false
}

public func parse(inout property: NSNumber?, value: Int) -> Bool {
	let converted : NSNumber? = convert(value)
	if let valid = converted {
		property = valid
		return true
	}
	return false
}

public func parse(inout property: NSNumber, value: Int,validate: (NSNumber)->Bool) -> Bool {
	let converted : NSNumber? = convert(value)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	return false
}

public func parse(inout property: NSNumber, value: Int) -> Bool {
	let converted : NSNumber? = convert(value)
	if let valid = converted {
		property = valid
		return true
	}
	return false
}

public func parse(inout property: NSNumber?, value: Int?,validate: (NSNumber)->Bool) -> Bool {
	if let validValue = value {
		let converted : NSNumber? = convert(validValue)
		if let valid = converted {
			if validate(valid) {
				property = valid
				return true
			}
		}
	}
	return false
}

public func parse(inout property: NSNumber?, value: Int?) -> Bool {
	if let validValue = value {
		let converted : NSNumber? = convert(validValue)
		if let valid = converted {
			property = valid
			return true
		}
	}
	return false
}

public func parse(inout property: NSNumber, value: Int?,validate: (NSNumber)->Bool) -> Bool {
	if let validValue = value {
		let converted : NSNumber? = convert(validValue)
		if let valid = converted {
			if validate(valid) {
				property = valid
				return true
			}
		}
	}
	return false
}

public func parse(inout property: NSNumber, value: Int?) -> Bool {
	if let validValue = value {
		let converted : NSNumber? = convert(validValue)
		if let valid = converted {
			property = valid
			return true
		}
	}
	return false
}

// MARK: NSNumber -> Int

public func parse(inout property: Int?, value: NSNumber,validate: (Int)->Bool) -> Bool {
	let converted : Int? = convert(value)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	return false
}

public func parse(inout property: Int?, value: NSNumber) -> Bool {
	let converted : Int? = convert(value)
	if let valid = converted {
		property = valid
		return true
	}
	return false
}

public func parse(inout property: Int, value: NSNumber,validate: (Int)->Bool) -> Bool {
	let converted : Int? = convert(value)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	return false
}

public func parse(inout property: Int, value: NSNumber) -> Bool {
	let converted : Int? = convert(value)
	if let valid = converted {
		property = valid
		return true
	}
	return false
}

public func parse(inout property: Int?, value: NSNumber?,validate: (Int)->Bool) -> Bool {
	if let validValue = value {
		let converted : Int? = convert(validValue)
		if let valid = converted {
			if validate(valid) {
				property = valid
				return true
			}
		}
	}
	return false
}

public func parse(inout property: Int?, value: NSNumber?) -> Bool {
	if let validValue = value {
		let converted : Int? = convert(validValue)
		if let valid = converted {
			property = valid
			return true
		}
	}
	return false
}

public func parse(inout property: Int, value: NSNumber?,validate: (Int)->Bool) -> Bool {
	if let validValue = value {
		let converted : Int? = convert(validValue)
		if let valid = converted {
			if validate(valid) {
				property = valid
				return true
			}
		}
	}
	return false
}

public func parse(inout property: Int, value: NSNumber?) -> Bool {
	if let validValue = value {
		let converted : Int? = convert(validValue)
		if let valid = converted {
			property = valid
			return true
		}
	}
	return false
}

// MARK: Int -> String

public func parse(inout property: String?, value: Int,validate: (String)->Bool) -> Bool {
	let converted : String? = convert(value)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	return false
}

public func parse(inout property: String?, value: Int) -> Bool {
	let converted : String? = convert(value)
	if let valid = converted {
		property = valid
		return true
	}
	return false
}

public func parse(inout property: String, value: Int,validate: (String)->Bool) -> Bool {
	let converted : String? = convert(value)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	return false
}

public func parse(inout property: String, value: Int) -> Bool {
	let converted : String? = convert(value)
	if let valid = converted {
		property = valid
		return true
	}
	return false
}

public func parse(inout property: String?, value: Int?,validate: (String)->Bool) -> Bool {
	if let validValue = value {
		let converted : String? = convert(validValue)
		if let valid = converted {
			if validate(valid) {
				property = valid
				return true
			}
		}
	}
	return false
}

public func parse(inout property: String?, value: Int?) -> Bool {
	if let validValue = value {
		let converted : String? = convert(validValue)
		if let valid = converted {
			property = valid
			return true
		}
	}
	return false
}

public func parse(inout property: String, value: Int?,validate: (String)->Bool) -> Bool {
	if let validValue = value {
		let converted : String? = convert(validValue)
		if let valid = converted {
			if validate(valid) {
				property = valid
				return true
			}
		}
	}
	return false
}

public func parse(inout property: String, value: Int?) -> Bool {
	if let validValue = value {
		let converted : String? = convert(validValue)
		if let valid = converted {
			property = valid
			return true
		}
	}
	return false
}

// MARK: String -> Int

public func parse(inout property: Int?, value: String,validate: (Int)->Bool) -> Bool {
	let converted : Int? = convert(value)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	return false
}

public func parse(inout property: Int?, value: String) -> Bool {
	let converted : Int? = convert(value)
	if let valid = converted {
		property = valid
		return true
	}
	return false
}

public func parse(inout property: Int, value: String,validate: (Int)->Bool) -> Bool {
	let converted : Int? = convert(value)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	return false
}

public func parse(inout property: Int, value: String) -> Bool {
	let converted : Int? = convert(value)
	if let valid = converted {
		property = valid
		return true
	}
	return false
}

public func parse(inout property: Int?, value: String?,validate: (Int)->Bool) -> Bool {
	if let validValue = value {
		let converted : Int? = convert(validValue)
		if let valid = converted {
			if validate(valid) {
				property = valid
				return true
			}
		}
	}
	return false
}

public func parse(inout property: Int?, value: String?) -> Bool {
	if let validValue = value {
		let converted : Int? = convert(validValue)
		if let valid = converted {
			property = valid
			return true
		}
	}
	return false
}

public func parse(inout property: Int, value: String?,validate: (Int)->Bool) -> Bool {
	if let validValue = value {
		let converted : Int? = convert(validValue)
		if let valid = converted {
			if validate(valid) {
				property = valid
				return true
			}
		}
	}
	return false
}

public func parse(inout property: Int, value: String?) -> Bool {
	if let validValue = value {
		let converted : Int? = convert(validValue)
		if let valid = converted {
			property = valid
			return true
		}
	}
	return false
}








// MARK: NSDate -> String

public func parse(inout property: String?, value: NSDate,format: String,validate: (String)->Bool) -> Bool {
	let converted : String? = convert(value,format)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	return false
}

public func parse(inout property: String?, value: NSDate,format: String) -> Bool {
	let converted : String? = convert(value,format)
	if let valid = converted {
		property = valid
		return true
	}
	return false
}

public func parse(inout property: String, value: NSDate,format: String,validate: (String)->Bool) -> Bool {
	let converted : String? = convert(value,format)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	return false
}

public func parse(inout property: String, value: NSDate,format: String) -> Bool {
	let converted : String? = convert(value,format)
	if let valid = converted {
		property = valid
		return true
	}
	return false
}

public func parse(inout property: String?, value: NSDate?,format: String,validate: (String)->Bool) -> Bool {
	if let validValue = value {
		let converted : String? = convert(validValue,format)
		if let valid = converted {
			if validate(valid) {
				property = valid
				return true
			}
		}
	}
	return false
}

public func parse(inout property: String?, value: NSDate?,format: String) -> Bool {
	if let validValue = value {
		let converted : String? = convert(validValue,format)
		if let valid = converted {
			property = valid
			return true
		}
	}
	return false
}

public func parse(inout property: String, value: NSDate?,format: String, validate: (String)->Bool) -> Bool {
	if let validValue = value {
		let converted : String? = convert(validValue,format)
		if let valid = converted {
			if validate(valid) {
				property = valid
				return true
			}
		}
	}
	return false
}

public func parse(inout property: String, value: NSDate?,format: String) -> Bool {
	if let validValue = value {
		let converted : String? = convert(validValue,format)
		if let valid = converted {
			property = valid
			return true
		}
	}
	return false
}

// MARK: String -> NSDate

public func parse(inout property: NSDate?, value: String,format: String,validate: (NSDate)->Bool) -> Bool {
	let converted : NSDate? = convert(value,format)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	return false
}

public func parse(inout property: NSDate?, value: String,format: String) -> Bool {
	let converted : NSDate? = convert(value,format)
	if let valid = converted {
		property = valid
		return true
	}
	return false
}

public func parse(inout property: NSDate, value: String,format: String,validate: (NSDate)->Bool) -> Bool {
	let converted : NSDate? = convert(value,format)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	return false
}

public func parse(inout property: NSDate, value: String,format: String) -> Bool {
	let converted : NSDate? = convert(value,format)
	if let valid = converted {
		property = valid
		return true
	}
	return false
}

public func parse(inout property: NSDate?, value: String?,format: String,validate: (NSDate)->Bool) -> Bool {
	if let validValue = value {
		let converted : NSDate? = convert(validValue,format)
		if let valid = converted {
			if validate(valid) {
				property = valid
				return true
			}
		}
	}
	return false
}

public func parse(inout property: NSDate?, value: String?,format: String) -> Bool {
	if let validValue = value {
		let converted : NSDate? = convert(validValue,format)
		if let valid = converted {
			property = valid
			return true
		}
	}
	return false
}

public func parse(inout property: NSDate, value: String?,format: String,validate: (NSDate)->Bool) -> Bool {
	if let validValue = value {
		let converted : NSDate? = convert(validValue,format)
		if let valid = converted {
			if validate(valid) {
				property = valid
				return true
			}
		}
	}
	return false
}

public func parse(inout property: NSDate, value: String?,format: String) -> Bool {
	if let validValue = value {
		let converted : NSDate? = convert(validValue,format)
		if let valid = converted {
			property = valid
			return true
		}
	}
	return false
}


