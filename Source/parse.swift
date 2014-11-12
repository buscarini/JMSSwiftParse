//
//  JMSSwiftParse.swift
//  JMSSwiftParse
//
//  Created by Jose Manuel Sánchez Peñarroja on 10/11/14.
//  Copyright (c) 2014 José Manuel Sánchez. All rights reserved.
//

import Foundation

// MARK: Generic Parsers

//public func parse<T,U>(inout property: T, value: U?,validate: (T)->Bool) -> Bool {
//	let converted : T? = convert(value)
//	if let valid = converted {
//		if validate(valid) {
//			property = valid
//			return true
//		}
//	}
//	
//	return false
//}

public func parse<T : Convertible,U : Convertible>(inout property: T, value: U,validate: (T)->Bool = { (val) in true }) -> Bool {
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

//public func parse<T: NilLiteralConvertible,U> (inout property: T, value: U,validate: (T)->Bool = { (val) in true }) -> Bool {
//	let converted : T? = convert(value)
//	if let valid = converted {
//		if validate(valid) {
//			property = valid
//			return true
//		}
//	}
//	return false
//}


//public func parse<T,U>(inout property: T?, value: U,validate: (T)->Bool = { (val) in true }) -> Bool {
//	let converted : T? = convert(value)
//	if let valid = converted {
//		if validate(valid) {
//			property = valid
//			return true
//		}
//	}
//	return false
//}


public func parse<T,U>(inout property: T, value: U?,validate: (T)->Bool = { (val) in true }) -> Bool {
	if let validValue = value {
		return parse(&property, validValue, validate: validate)
	}
	
	return false
}

/*public func parse<T,U>(inout property: T, value: U) -> Bool {
	return parse(&property, value) { (val) in true }
}

public func parse<T,U>(inout property: T?, value: U) -> Bool {
	return parse(&property, value) { (val) in true }
}
*/

//public func parse<T,U>(inout property: T, value: U?) -> Bool {
//	if let validValue = value {
//		return parse(&property, validValue) { (val) in true }
//	}
//	return false
//}

// MARK: The rest of the file is redundant, but necessary (this should be a bug in Swift)

// MARK: String -> Bool
/*

public func parse<T: BooleanLiteralConvertible>(inout property: T, value: String?,validate: (T)->Bool) -> Bool {
	let converted : T? = convert(value)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	
	return false
}

public func parse<T: BooleanLiteralConvertible>(inout property: T, value: String?) -> Bool {
	return parse(&property,value,{ (val) in true })
}

public func parse<T: BooleanLiteralConvertible>(inout property: T, value: NSString?,validate: (T)->Bool) -> Bool {
	return parse(&property,value as? String,validate)
}

public func parse<T: BooleanLiteralConvertible>(inout property: T, value: NSString?) -> Bool {
	return parse(&property,value as? String,{ (val) in true })
}

// MARK: Bool -> String

public func parse<T: BooleanLiteralConvertible>(inout property: String, value: T?,validate: (String)->Bool) -> Bool {
	let converted : String? = convert(value)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	
	return false
}

public func parse<T: BooleanLiteralConvertible>(inout property: String, value: T?) -> Bool {
	return parse(&property,value,{ (val) in true })
}

public func parse<T: BooleanLiteralConvertible>(inout property: NSString, value: T?,validate: (NSString)->Bool) -> Bool {
	return parse(&property,value,validate)
}

public func parse<T: BooleanLiteralConvertible>(inout property: NSString, value: T?) -> Bool {
	return parse(&property,value,{ (val) in true })
}*/

// MARK: String -> NSURL
/*
public func parse(inout property: NSURL, value: String?,validate: (NSURL)->Bool) -> Bool {
	let converted : NSURL? = convert(value)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	
	return false
}

public func parse(inout property: NSURL, value: String?) -> Bool {
	return parse(&property,value,{ (val) in true })
}

public func parse(inout property: NSURL, value: NSString?,validate: (NSURL)->Bool) -> Bool {
	return parse(&property,value as? String,validate)
}

public func parse(inout property: NSURL, value: NSString?) -> Bool {
	return parse(&property,value as? String,{ (val) in true })
}*/

// MARK: NSURL -> String
/*
public func parse(inout property: String, value: NSURL?,validate: (String)->Bool) -> Bool {
	let converted : String? = convert(value)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	
	return false
}

public func parse(inout property: String, value: NSURL?) -> Bool {
	return parse(&property,value,{ (val) in true })
}

public func parse(inout property: NSString, value: NSURL?,validate: (NSString)->Bool) -> Bool {
	return parse(&property,value,validate)
}

public func parse(inout property: NSString, value: NSURL?) -> Bool {
	return parse(&property,value,{ (val) in true })
}
*/

// MARK: String -> Int
/*
public func parse<T: IntegerType>(inout property: T, value: String?,validate: (T)->Bool = { (val) in true }) -> Bool {
	let converted : T? = convert(value)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	
	return false
}

public func parse<T: IntegerType>(inout property: T, value: NSString?,validate: (T)->Bool = { (val) in true }) -> Bool {
	return parse(&property, value as? String,validate)
}*/

// MARK: Int -> String

//public func parse<T: IntegerType>(inout property: String, value: T?,validate: (String)->Bool = { (val) in true }) -> Bool {
//	let converted : String? = convert(value)
//	if let valid = converted {
//		if validate(valid) {
//			property = valid
//			return true
//		}
//	}
//	
//	return false
//}

//public func parse<T: IntegerType>(inout property: NSString, value: T?,validate: (String)->Bool = { (val) in true }) -> Bool {
//	return parse(&property, value,validate)
//}


// MARK: NSURL -> String
/*
public func parse(inout property: String, value: NSURL?,validate: (String)->Bool) -> Bool {
	let converted : String? = convert(value)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	
	return false
}

public func parse(inout property: String, value: NSURL?) -> Bool {
	return parse(&property, value) { (val) in true }
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
	return parse(&property, value) { (val) in true }
}*/

// MARK: NSURL -> NSString
/*
public func parse(inout property: NSString, value: NSURL?,validate: (String)->Bool) -> Bool {
	let converted : NSString? = convert(value)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	
	return false
}

public func parse(inout property: NSString, value: NSURL?) -> Bool {
	return parse(&property, value) { (val) in true }
}

public func parse(inout property: NSString, value: NSURL,validate: (String)->Bool) -> Bool {
	let converted : NSString? = convert(value)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	
	return false
}

public func parse(inout property: NSString, value: NSURL) -> Bool {
	return parse(&property, value) { (val) in true }
}
*/

// MARK: String -> NSURL
/*
public func parse(inout property: NSURL?, value: String?,validate: (NSURL)->Bool) -> Bool {
	let converted : NSURL? = convert(value)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	
	return false
}

public func parse(inout property: NSURL?, value: String?) -> Bool {
	return parse(&property, value) { (val) in true }
}

public func parse(inout property: NSURL, value: String?,validate: (NSURL)->Bool) -> Bool {
	let converted : NSURL? = convert(value)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	
	return false
}

public func parse(inout property: NSURL, value: String?) -> Bool {
	return parse(&property, value) { (val) in true }
}

// MARK: NSString -> NSURL

public func parse(inout property: NSURL?, value: NSString?,validate: (NSURL)->Bool) -> Bool {
	let converted : NSURL? = convert(value)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	
	return false
}

public func parse(inout property: NSURL?, value: NSString?) -> Bool {
	return parse(&property, value) { (val) in true }
}

public func parse(inout property: NSURL, value: NSString?,validate: (NSURL)->Bool) -> Bool {
	let converted : NSURL? = convert(value)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	
	return false
}

public func parse(inout property: NSURL, value: NSString?) -> Bool {
	return parse(&property, value) { (val) in true }
}
*/
