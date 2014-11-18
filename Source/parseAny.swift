//
//  parseAny.swift
//  JMSSwiftParse
//
//  Created by Jose Manuel Sánchez Peñarroja on 18/11/14.
//  Copyright (c) 2014 José Manuel Sánchez. All rights reserved.
//

import Foundation

// MARK: T <-> AnyObject

public func parse<T: Hashable>(inout property: T?, value: AnyObject,validate: (T)->Bool) -> Bool {
	var converted : T?
	downcast(&converted, value)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	return false
}

public func parse<T: Hashable>(inout property: T?, value: AnyObject) -> Bool {
	var converted : T?
	downcast(&converted, value)
	if let valid = converted {
		property = valid
		return true
	}
	return false
}

public func parse<T: Hashable>(inout property: T, value: AnyObject,validate: (T)->Bool) -> Bool {
	var converted : T?
	downcast(&converted, value)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	return false
}

public func parse<T: Hashable>(inout property: T, value: AnyObject) -> Bool {
	var converted : T?
	downcast(&converted, value)
	if let valid = converted {
		property = valid
		return true
	}
	return false
}

public func parse<T: Hashable>(inout property: T?, value: AnyObject?,validate: (T)->Bool) -> Bool {
	if let validValue : AnyObject = value {
		var converted : T?
		downcast(&converted, value)
		if let valid = converted {
			if validate(valid) {
				property = valid
				return true
			}
		}
	}
	return false
}

public func parse<T: Hashable>(inout property: T?, value: AnyObject?) -> Bool {
	if let validValue : AnyObject = value {
		var converted : T?
		downcast(&converted, value)
		if let valid = converted {
			property = valid
			return true
		}
	}
	return false
}

public func parse<T: Hashable>(inout property: T, value: AnyObject?,validate: (T)->Bool) -> Bool {
	if let validValue : AnyObject = value {
		var converted : T?
		downcast(&converted, value)
		if let valid = converted {
			if validate(valid) {
				property = valid
				return true
			}
		}
	}
	return false
}

public func parse<T: Hashable>(inout property: T, value: AnyObject?) -> Bool {
	if let validValue : AnyObject = value {
		var converted : T?
		downcast(&converted, value)
		if let valid = converted {
			property = valid
			return true
		}
	}
	return false
}

// MARK: NSDate <-> AnyObject

public func parse(inout property: NSDate?, value: AnyObject, format: String,validate: (NSDate)->Bool) -> Bool {
	var converted : NSDate?
	downcast(&converted, value, format)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	return false
}

public func parse(inout property: NSDate?, value: AnyObject, format: String) -> Bool {
	var converted : NSDate?
	downcast(&converted, value, format)
	if let valid = converted {
		property = valid
		return true
	}
	return false
}

public func parse(inout property: NSDate, value: AnyObject, format: String,validate: (NSDate)->Bool) -> Bool {
	var converted : NSDate?
	downcast(&converted, value, format)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	return false
}

public func parse(inout property: NSDate, value: AnyObject, format: String) -> Bool {
	var converted : NSDate?
	downcast(&converted, value, format)
	if let valid = converted {
		property = valid
		return true
	}
	return false
}

public func parse(inout property: NSDate?, value: AnyObject?, format: String,validate: (NSDate)->Bool) -> Bool {
	if let validValue : AnyObject = value {
		var converted : NSDate?
		downcast(&converted, value, format)
		if let valid = converted {
			if validate(valid) {
				property = valid
				return true
			}
		}
	}
	return false
}

public func parse(inout property: NSDate?, value: AnyObject?, format: String) -> Bool {
	if let validValue : AnyObject = value {
		var converted : NSDate?
		downcast(&converted, value, format)
		if let valid = converted {
			property = valid
			return true
		}
	}
	return false
}

public func parse(inout property: NSDate, value: AnyObject?, format: String,validate: (NSDate)->Bool) -> Bool {
	if let validValue : AnyObject = value {
		var converted : NSDate?
		downcast(&converted, value, format)
		if let valid = converted {
			if validate(valid) {
				property = valid
				return true
			}
		}
	}
	return false
}

public func parse(inout property: NSDate, value: AnyObject?, format: String) -> Bool {
	if let validValue : AnyObject = value {
		var converted : NSDate?
		downcast(&converted, value, format)
		if let valid = converted {
			property = valid
			return true
		}
	}
	return false
}

// MARK: String <-> AnyObject

public func parse(inout property: String?, value: AnyObject,validate: (String)->Bool) -> Bool {
	var converted : String?
	downcast(&converted, value)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	return false
}

public func parse(inout property: String?, value: AnyObject) -> Bool {
	var converted : String?
	downcast(&converted, value)
	if let valid = converted {
		property = valid
		return true
	}
	return false
}

public func parse(inout property: String, value: AnyObject,validate: (String)->Bool) -> Bool {
	var converted : String?
	downcast(&converted, value)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	return false
}

public func parse(inout property: String, value: AnyObject) -> Bool {
	var converted : String?
	downcast(&converted, value)
	if let valid = converted {
		property = valid
		return true
	}
	return false
}

public func parse(inout property: String?, value: AnyObject?,validate: (String)->Bool) -> Bool {
	if let validValue : AnyObject = value {
		var converted : String?
		downcast(&converted, value)
		if let valid = converted {
			if validate(valid) {
				property = valid
				return true
			}
		}
	}
	return false
}

public func parse(inout property: String?, value: AnyObject?) -> Bool {
	if let validValue : AnyObject = value {
		var converted : String?
		downcast(&converted, value)
		if let valid = converted {
			property = valid
			return true
		}
	}
	return false
}

public func parse(inout property: String, value: AnyObject?,validate: (String)->Bool) -> Bool {
	if let validValue : AnyObject = value {
		var converted : String?
		downcast(&converted, value)
		if let valid = converted {
			if validate(valid) {
				property = valid
				return true
			}
		}
	}
	return false
}

public func parse(inout property: String, value: AnyObject?) -> Bool {
	if let validValue : AnyObject = value {
		var converted : String?
		downcast(&converted, value)
		if let valid = converted {
			property = valid
			return true
		}
	}
	return false
}

// MARK: NSString <-> AnyObject

public func parse(inout property: NSString?, value: AnyObject,validate: (NSString)->Bool) -> Bool {
	var converted : NSString?
	downcast(&converted, value)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	return false
}

public func parse(inout property: NSString?, value: AnyObject) -> Bool {
	var converted : NSString?
	downcast(&converted, value)
	if let valid = converted {
		property = valid
		return true
	}
	return false
}

public func parse(inout property: NSString, value: AnyObject,validate: (NSString)->Bool) -> Bool {
	var converted : NSString?
	downcast(&converted, value)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	return false
}

public func parse(inout property: NSString, value: AnyObject) -> Bool {
	var converted : NSString?
	downcast(&converted, value)
	if let valid = converted {
		property = valid
		return true
	}
	return false
}

public func parse(inout property: NSString?, value: AnyObject?,validate: (NSString)->Bool) -> Bool {
	if let validValue : AnyObject = value {
		var converted : NSString?
		downcast(&converted, value)
		if let valid = converted {
			if validate(valid) {
				property = valid
				return true
			}
		}
	}
	return false
}

public func parse(inout property: NSString?, value: AnyObject?) -> Bool {
	if let validValue : AnyObject = value {
		var converted : NSString?
		downcast(&converted, value)
		if let valid = converted {
			property = valid
			return true
		}
	}
	return false
}

public func parse(inout property: NSString, value: AnyObject?,validate: (NSString)->Bool) -> Bool {
	if let validValue : AnyObject = value {
		var converted : NSString?
		downcast(&converted, value)
		if let valid = converted {
			if validate(valid) {
				property = valid
				return true
			}
		}
	}
	return false
}

public func parse(inout property: NSString, value: AnyObject?) -> Bool {
	if let validValue : AnyObject = value {
		var converted : NSString?
		downcast(&converted, value)
		if let valid = converted {
			property = valid
			return true
		}
	}
	return false
}


// MARK: NSURL <-> AnyObject

public func parse(inout property: NSURL?, value: AnyObject,validate: (NSURL)->Bool) -> Bool {
	var converted : NSURL?
	downcast(&converted, value)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	return false
}

public func parse(inout property: NSURL?, value: AnyObject) -> Bool {
	var converted : NSURL?
	downcast(&converted, value)
	if let valid = converted {
		property = valid
		return true
	}
	return false
}

public func parse(inout property: NSURL, value: AnyObject,validate: (NSURL)->Bool) -> Bool {
	var converted : NSURL?
	downcast(&converted, value)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	return false
}

public func parse(inout property: NSURL, value: AnyObject) -> Bool {
	var converted : NSURL?
	downcast(&converted, value)
	if let valid = converted {
		property = valid
		return true
	}
	return false
}

public func parse(inout property: NSURL?, value: AnyObject?,validate: (NSURL)->Bool) -> Bool {
	if let validValue : AnyObject = value {
		var converted : NSURL?
		downcast(&converted, value)
		if let valid = converted {
			if validate(valid) {
				property = valid
				return true
			}
		}
	}
	return false
}

public func parse(inout property: NSURL?, value: AnyObject?) -> Bool {
	if let validValue : AnyObject = value {
		var converted : NSURL?
		downcast(&converted, value)
		if let valid = converted {
			property = valid
			return true
		}
	}
	return false
}

public func parse(inout property: NSURL, value: AnyObject?,validate: (NSURL)->Bool) -> Bool {
	if let validValue : AnyObject = value {
		var converted : NSURL?
		downcast(&converted, value)
		if let valid = converted {
			if validate(valid) {
				property = valid
				return true
			}
		}
	}
	return false
}

public func parse(inout property: NSURL, value: AnyObject?) -> Bool {
	if let validValue : AnyObject = value {
		var converted : NSURL?
		downcast(&converted, value)
		if let valid = converted {
			property = valid
			return true
		}
	}
	return false
}

// MARK: Bool <-> AnyObject

public func parse(inout property: Bool?, value: AnyObject,validate: (Bool)->Bool) -> Bool {
	var converted : Bool?
	downcast(&converted, value)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	return false
}

public func parse(inout property: Bool?, value: AnyObject) -> Bool {
	var converted : Bool?
	downcast(&converted, value)
	if let valid = converted {
		property = valid
		return true
	}
	return false
}

public func parse(inout property: Bool, value: AnyObject,validate: (Bool)->Bool) -> Bool {
	var converted : Bool?
	downcast(&converted, value)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	return false
}

public func parse(inout property: Bool, value: AnyObject) -> Bool {
	var converted : Bool?
	downcast(&converted, value)
	if let valid = converted {
		property = valid
		return true
	}
	return false
}

public func parse(inout property: Bool?, value: AnyObject?,validate: (Bool)->Bool) -> Bool {
	if let validValue : AnyObject = value {
		var converted : Bool?
		downcast(&converted, value)
		if let valid = converted {
			if validate(valid) {
				property = valid
				return true
			}
		}
	}
	return false
}

public func parse(inout property: Bool?, value: AnyObject?) -> Bool {
	if let validValue : AnyObject = value {
		var converted : Bool?
		downcast(&converted, value)
		if let valid = converted {
			property = valid
			return true
		}
	}
	return false
}

public func parse(inout property: Bool, value: AnyObject?,validate: (Bool)->Bool) -> Bool {
	if let validValue : AnyObject = value {
		var converted : Bool?
		downcast(&converted, value)
		if let valid = converted {
			if validate(valid) {
				property = valid
				return true
			}
		}
	}
	return false
}

public func parse(inout property: Bool, value: AnyObject?) -> Bool {
	if let validValue : AnyObject = value {
		var converted : Bool?
		downcast(&converted, value)
		if let valid = converted {
			property = valid
			return true
		}
	}
	return false
}

// MARK: Int <-> AnyObject

public func parse(inout property: Int?, value: AnyObject,validate: (Int)->Bool) -> Bool {
	var converted : Int?
	downcast(&converted, value)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	return false
}

public func parse(inout property: Int?, value: AnyObject) -> Bool {
	var converted : Int?
	downcast(&converted, value)
	if let valid = converted {
		property = valid
		return true
	}
	return false
}

public func parse(inout property: Int, value: AnyObject,validate: (Int)->Bool) -> Bool {
	var converted : Int?
	downcast(&converted, value)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	return false
}

public func parse(inout property: Int, value: AnyObject) -> Bool {
	var converted : Int?
	downcast(&converted, value)
	if let valid = converted {
		property = valid
		return true
	}
	return false
}

public func parse(inout property: Int?, value: AnyObject?,validate: (Int)->Bool) -> Bool {
	if let validValue : AnyObject = value {
		var converted : Int?
		downcast(&converted, value)
		if let valid = converted {
			if validate(valid) {
				property = valid
				return true
			}
		}
	}
	return false
}

public func parse(inout property: Int?, value: AnyObject?) -> Bool {
	if let validValue : AnyObject = value {
		var converted : Int?
		downcast(&converted, value)
		if let valid = converted {
			property = valid
			return true
		}
	}
	return false
}

public func parse(inout property: Int, value: AnyObject?,validate: (Int)->Bool) -> Bool {
	if let validValue : AnyObject = value {
		var converted : Int?
		downcast(&converted, value)
		if let valid = converted {
			if validate(valid) {
				property = valid
				return true
			}
		}
	}
	return false
}

public func parse(inout property: Int, value: AnyObject?) -> Bool {
	if let validValue : AnyObject = value {
		var converted : Int?
		downcast(&converted, value)
		if let valid = converted {
			property = valid
			return true
		}
	}
	return false
}

// MARK: NSNumber <-> AnyObject

public func parse(inout property: NSNumber?, value: AnyObject,validate: (NSNumber)->Bool) -> Bool {
	var converted : NSNumber?
	downcast(&converted, value)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	return false
}

public func parse(inout property: NSNumber?, value: AnyObject) -> Bool {
	var converted : NSNumber?
	downcast(&converted, value)
	if let valid = converted {
		property = valid
		return true
	}
	return false
}

public func parse(inout property: NSNumber, value: AnyObject,validate: (NSNumber)->Bool) -> Bool {
	var converted : NSNumber?
	downcast(&converted, value)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	return false
}

public func parse(inout property: NSNumber, value: AnyObject) -> Bool {
	var converted : NSNumber?
	downcast(&converted, value)
	if let valid = converted {
		property = valid
		return true
	}
	return false
}

public func parse(inout property: NSNumber?, value: AnyObject?,validate: (NSNumber)->Bool) -> Bool {
	if let validValue : AnyObject = value {
		var converted : NSNumber?
		downcast(&converted, value)
		if let valid = converted {
			if validate(valid) {
				property = valid
				return true
			}
		}
	}
	return false
}

public func parse(inout property: NSNumber?, value: AnyObject?) -> Bool {
	if let validValue : AnyObject = value {
		var converted : NSNumber?
		downcast(&converted, value)
		if let valid = converted {
			property = valid
			return true
		}
	}
	return false
}

public func parse(inout property: NSNumber, value: AnyObject?,validate: (NSNumber)->Bool) -> Bool {
	if let validValue : AnyObject = value {
		var converted : NSNumber?
		downcast(&converted, value)
		if let valid = converted {
			if validate(valid) {
				property = valid
				return true
			}
		}
	}
	return false
}

public func parse(inout property: NSNumber, value: AnyObject?) -> Bool {
	if let validValue : AnyObject = value {
		var converted : NSNumber?
		downcast(&converted, value)
		if let valid = converted {
			property = valid
			return true
		}
	}
	return false
}
