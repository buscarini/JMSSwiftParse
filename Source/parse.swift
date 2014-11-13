//
//  JMSSwiftParse.swift
//  JMSSwiftParse
//
//  Created by Jose Manuel Sánchez Peñarroja on 10/11/14.
//  Copyright (c) 2014 José Manuel Sánchez. All rights reserved.
//

import Foundation

// MARK: Generic Parsers

/*public func parse<T : Convertible,U : Convertible>(inout property: T, value: U,validate: (T)->Bool = { (val) in true }) -> Bool {
	let converted : T? = convert(value)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	return false
}

public func parse<T : Convertible,U: Convertible>(inout property: T?, value: U,validate: (T)->Bool = { (val) in true }) -> Bool {
	let converted : T? = convert(value)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	return false
}

public func parse<T : Convertible,U: Convertible>(inout property: T, value: U?,validate: (T)->Bool = { (val) in true }) -> Bool {
	if let validValue : U = value {
		return parse(&property, validValue, validate: validate)
	}
	return false
}

public func parse<T : Convertible,U: Convertible>(inout property: T?, value: U?,validate: (T)->Bool = { (val) in true }) -> Bool {
	if let validValue : U = value {
		return parse(&property, validValue, validate: validate)
	}
	return false
}*/


/*public func parse<T>(inout property: T, value: T,validate: (T)->Bool = { (val) in true }) -> Bool {
	if validate(value) {
		property = value
		return true
	}
	return false
}*/

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

// MARK: NSNumber <-> String
/*
public func parse(inout property: String, value: NSNumber,validate: (String)->Bool = { (val) in true }) -> Bool {
	let converted : String? = convert(value)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	return false
}

public func parse(inout property: NSNumber, value: String,validate: (NSNumber)->Bool = { (val) in true }) -> Bool {
	let converted : NSNumber? = convert(value)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	return false
}
*/




