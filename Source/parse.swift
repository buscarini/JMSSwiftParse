//
//  JMSSwiftParse.swift
//  JMSSwiftParse
//
//  Created by Jose Manuel Sánchez Peñarroja on 10/11/14.
//  Copyright (c) 2014 José Manuel Sánchez. All rights reserved.
//

import Foundation

/// MARk: Parsers

public func parse<T,U>(inout property: T, value: U?,validate: (T)->Bool) -> Bool {
	let converted : T? = convert(value)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	
	return false
}

public func parse<T,U>(inout property: T, value: U?) -> Bool {
	return parse(&property, value) { (val) in true }
}

/// MARK: The rest of the file is redundant, but necessary (this should be a bug in Swift)

/// MARK: Bool

public func parse<T: BooleanLiteralConvertible>(inout property: T, value: String?) -> Bool {
	let converted : T? = convert(value)
	if let valid = converted {
		property = valid
		return true
	}
	
	return false
}

public func parse<T: BooleanLiteralConvertible>(inout property: String, value: T?) -> Bool {
	let converted : String? = convert(value)
	if let valid = converted {
		property = valid
		return true
	}
	
	return false
}

public func parse<T: BooleanLiteralConvertible>(inout property: T, value: NSString?) -> Bool {
	let converted : T? = convert(value)
	if let valid = converted {
		property = valid
		return true
	}
	
	return false
}

public func parse<T: BooleanLiteralConvertible>(inout property: NSString, value: T?) -> Bool {
	let converted : NSString? = convert(value)
	if let valid = converted {
		property = valid
		return true
	}
	
	return false
}


/// MARK: NSURL -> String

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
}

/// MARK: NSURL -> NSString

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


/// MARK: String -> NSURL

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

/// MARK: NSString -> NSURL

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

/// MARK: Bool -> String

/*public func parse(inout property: String, value: Bool?,validate: (String)->Bool) -> Bool {
	let converted : String? = convert(value)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	
	return false
}

public func parse(inout property: String, value: Bool?) -> Bool {
	return parse(&property, value) { (val) in true }
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
	return parse(&property, value) { (val) in true }
}

/// MARK: Bool -> NSString

public func parse(inout property: NSString, value: Bool?,validate: (NSString)->Bool) -> Bool {
	let converted : NSString? = convert(value)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	
	return false
}

public func parse(inout property: NSString, value: Bool?) -> Bool {
	return parse(&property, value) { (val) in true }
}

public func parse(inout property: NSString, value: Bool,validate: (NSString)->Bool) -> Bool {
	let converted : NSString? = convert(value)
	if let valid = converted {
		if validate(valid) {
			property = valid
			return true
		}
	}
	
	return false
}

public func parse(inout property: NSString, value: Bool) -> Bool {
	return parse(&property, value) { (val) in true }
}
*/
/// MARK: String -> Bool


//public func parse<T: BooleanLiteralConvertible>(inout property: T, value: String?,validate: (T)->Bool) -> Bool {
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
//
//public func parse<T: BooleanLiteralConvertible>(inout property: Bool, value: String?) -> Bool {
//	return parse(&property, value) { (val) in true }
//}

//public func parse(inout property: Bool, value: String?,validate: (Bool)->Bool) -> Bool {
//	let converted : Bool? = convert(value)
//	if let valid = converted {
//		if validate(valid) {
//			property = valid
//			return true
//		}
//	}
//	
//	return false
//}
//
//public func parse(inout property: Bool, value: String?) -> Bool {
//	return parse(&property, value) { (val) in true }
//}
//
//public func parse(inout property: Bool, value: String,validate: (Bool)->Bool) -> Bool {
//	let converted : Bool? = convert(value)
//	if let valid = converted {
//		if validate(valid) {
//			property = valid
//			return true
//		}
//	}
//	
//	return false
//}
//
//public func parse(inout property: Bool, value: String) -> Bool {
//	return parse(&property, value) { (val) in true }
//}
//
///// MARK: NSString -> Bool
//
//public func parse(inout property: Bool, value: NSString?,validate: (Bool)->Bool) -> Bool {
//	let converted : Bool? = convert(value)
//	if let valid = converted {
//		if validate(valid) {
//			property = valid
//			return true
//		}
//	}
//	
//	return false
//}
//
//public func parse(inout property: Bool, value: NSString?) -> Bool {
//	return parse(&property, value) { (val) in true }
//}
//
//public func parse(inout property: Bool, value: NSString,validate: (Bool)->Bool) -> Bool {
//	let converted : Bool? = convert(value)
//	if let valid = converted {
//		if validate(valid) {
//			property = valid
//			return true
//		}
//	}
//	
//	return false
//}
//
//public func parse(inout property: Bool, value: NSString) -> Bool {
//	return parse(&property, value) { (val) in true }
//}

/// MARK: IntegerType -> String

//public func parse<T: IntegerType>(inout property: String, value: T?,validate: (String)->Bool) -> Bool {
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
//
//public func parse<T: IntegerType>(inout property: String, value: T?) -> Bool {
//	return parse(&property, value) { (val) in true }
//}
//
//public func parse<T: IntegerType>(inout property: String, value: T,validate: (String)->Bool) -> Bool {
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
//
//public func parse<T: IntegerType>(inout property: String, value: T) -> Bool {
//	return parse(&property, value) { (val) in true }
//}


