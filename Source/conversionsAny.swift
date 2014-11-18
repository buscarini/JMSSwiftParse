//
//  conversionsAny.swift
//  JMSSwiftParse
//
//  Created by Jose Manuel Sánchez Peñarroja on 18/11/14.
//  Copyright (c) 2014 José Manuel Sánchez. All rights reserved.
//

import Foundation


// MARK: Generic downcast

func downcast<T: Hashable>(inout property: T?,value: AnyObject?) -> Bool {
	switch value {
	case let downcasted as NSNumber:
		property = convert(downcasted)
	case let downcasted as NSNull:
		property = convert(downcasted)
		return true
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

func downcast<T: Hashable>(inout property: T?,value: AnyObject) -> Bool {
	switch value {
	case let downcasted as NSNumber:
		property = convert(downcasted)
	case let downcasted as NSNull:
		property = convert(downcasted)
		return true
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

func downcast<T: Hashable>(inout property: T,value: AnyObject?) -> Bool {
	var optionalProperty : T?
	switch value {
	case let downcasted as NSNumber:
		optionalProperty = convert(downcasted)
	case let downcasted as NSNull:
		optionalProperty = convert(downcasted)
		return true
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

func downcast<T: Hashable>(inout property: T,value: AnyObject) -> Bool {
	var optionalProperty : T?
	switch value {
	case let downcasted as NSNumber:
		optionalProperty = convert(downcasted)
	case let downcasted as NSNull:
		optionalProperty = convert(downcasted)
		return true
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

// MARK: String

func downcast(inout property: String?,value: AnyObject?) -> Bool {
	switch value {
	case let downcasted as NSNumber:
		property = convert(downcasted)
	case let downcasted as NSNull:
		property = convert(downcasted)
		return true
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

func downcast(inout property: String?,value: AnyObject) -> Bool {
	switch value {
	case let downcasted as NSNumber:
		property = convert(downcasted)
	case let downcasted as NSNull:
		property = convert(downcasted)
		return true
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

func downcast(inout property: String,value: AnyObject?) -> Bool {
	var optionalProperty : String?
	switch value {
	case let downcasted as NSNumber:
		optionalProperty = convert(downcasted)
	case let downcasted as NSNull:
		optionalProperty = convert(downcasted)
		return true
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

func downcast(inout property: String,value: AnyObject) -> Bool {
	var optionalProperty : String?
	switch value {
	case let downcasted as NSNumber:
		optionalProperty = convert(downcasted)
	case let downcasted as NSNull:
		optionalProperty = convert(downcasted)
		return true
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

// MARK: NSString

func downcast(inout property: NSString?,value: AnyObject?) -> Bool {
	switch value {
	case let downcasted as NSNumber:
		property = convert(downcasted)
	case let downcasted as NSNull:
		property = convert(downcasted)
		return true
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

func downcast(inout property: NSString?,value: AnyObject) -> Bool {
	switch value {
	case let downcasted as NSNumber:
		property = convert(downcasted)
	case let downcasted as NSNull:
		property = convert(downcasted)
		return true
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

func downcast(inout property: NSString,value: AnyObject?) -> Bool {
	var optionalProperty : NSString?
	switch value {
	case let downcasted as NSNumber:
		optionalProperty = convert(downcasted)
	case let downcasted as NSNull:
		optionalProperty = convert(downcasted)
		return true
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

func downcast(inout property: NSString,value: AnyObject) -> Bool {
	var optionalProperty : NSString?
	switch value {
	case let downcasted as NSNumber:
		optionalProperty = convert(downcasted)
	case let downcasted as NSNull:
		optionalProperty = convert(downcasted)
		return true
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

// MARK: NSURL

func downcast(inout property: NSURL?,value: AnyObject?) -> Bool {
	switch value {
	case let downcasted as NSNumber:
		property = convert(downcasted)
	case let downcasted as NSNull:
		property = convert(downcasted)
		return true
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

func downcast(inout property: NSURL?,value: AnyObject) -> Bool {
	switch value {
	case let downcasted as NSNumber:
		property = convert(downcasted)
	case let downcasted as NSNull:
		property = convert(downcasted)
		return true
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

func downcast(inout property: NSURL,value: AnyObject?) -> Bool {
	var optionalProperty : NSURL?
	switch value {
	case let downcasted as NSNumber:
		optionalProperty = convert(downcasted)
	case let downcasted as NSNull:
		optionalProperty = convert(downcasted)
		return true
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

func downcast(inout property: NSURL,value: AnyObject) -> Bool {
	var optionalProperty : NSURL?
	switch value {
	case let downcasted as NSNumber:
		optionalProperty = convert(downcasted)
	case let downcasted as NSNull:
		optionalProperty = convert(downcasted)
		return true
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

// MARK: Bool

func downcast(inout property: Bool?,value: AnyObject?) -> Bool {
	switch value {
	case let downcasted as NSNumber:
		property = convert(downcasted)
	case let downcasted as NSNull:
		property = convert(downcasted)
		return true
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

func downcast(inout property: Bool?,value: AnyObject) -> Bool {
	switch value {
	case let downcasted as NSNumber:
		property = convert(downcasted)
	case let downcasted as NSNull:
		property = convert(downcasted)
		return true
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

func downcast(inout property: Bool,value: AnyObject?) -> Bool {
	var optionalProperty : Bool?
	switch value {
	case let downcasted as NSNumber:
		optionalProperty = convert(downcasted)
	case let downcasted as NSNull:
		optionalProperty = convert(downcasted)
		return true
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

func downcast(inout property: Bool,value: AnyObject) -> Bool {
	var optionalProperty : Bool?
	switch value {
	case let downcasted as NSNumber:
		optionalProperty = convert(downcasted)
	case let downcasted as NSNull:
		optionalProperty = convert(downcasted)
		return true
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

// MARK: Int

func downcast(inout property: Int?,value: AnyObject?) -> Bool {
	switch value {
	case let downcasted as NSNumber:
		property = convert(downcasted)
	case let downcasted as NSNull:
		property = convert(downcasted)
		return true
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

func downcast(inout property: Int?,value: AnyObject) -> Bool {
	switch value {
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

func downcast(inout property: Int,value: AnyObject?) -> Bool {
	var optionalProperty : Int?
	switch value {
	case let downcasted as NSNumber:
		optionalProperty = convert(downcasted)
	case let downcasted as NSNull:
		optionalProperty = convert(downcasted)
		return true
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

func downcast(inout property: Int,value: AnyObject) -> Bool {
	var optionalProperty : Int?
	switch value {
	case let downcasted as NSNumber:
		optionalProperty = convert(downcasted)
	case let downcasted as NSNull:
		optionalProperty = convert(downcasted)
		return true
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

// MARK: Double

func downcast(inout property: Double?,value: AnyObject?) -> Bool {
	switch value {
	case let downcasted as NSNumber:
		property = convert(downcasted)
	case let downcasted as NSNull:
		property = convert(downcasted)
		return true
	case let downcasted as Bool:
		property = convert(downcasted)
	case let downcasted as Double:
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

func downcast(inout property: Double?,value: AnyObject) -> Bool {
	switch value {
	case let downcasted as Double:
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

func downcast(inout property: Double,value: AnyObject?) -> Bool {
	var optionalProperty : Double?
	switch value {
	case let downcasted as NSNumber:
		optionalProperty = convert(downcasted)
	case let downcasted as NSNull:
		optionalProperty = convert(downcasted)
		return true
	case let downcasted as Bool:
		optionalProperty = convert(downcasted)
	case let downcasted as Double:
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

func downcast(inout property: Double,value: AnyObject) -> Bool {
	var optionalProperty : Double?
	switch value {
	case let downcasted as NSNumber:
		optionalProperty = convert(downcasted)
	case let downcasted as NSNull:
		optionalProperty = convert(downcasted)
		return true
	case let downcasted as Bool:
		optionalProperty = convert(downcasted)
	case let downcasted as Double:
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

// MARK: NSDate

func downcast(inout property: NSDate?,value: AnyObject?,format: String) -> Bool {
	switch value {
	case let downcasted as String:
		property = convert(downcasted, format)
	case let downcasted as NSString:
		property = convert(downcasted, format)
	case let downcasted as NSDate:
		property = downcasted
	default:
		return false
	}
	
	return property.hasValue
}

// MARK: NSNumber

func downcast(inout property: NSNumber?,value: AnyObject?) -> Bool {
	switch value {
	case let downcasted as NSNumber:
		property = convert(downcasted)
	case let downcasted as NSNull:
		property = convert(downcasted)
		return true
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

func downcast(inout property: NSNumber?,value: AnyObject) -> Bool {
	switch value {
	case let downcasted as NSNumber:
		property = convert(downcasted)
	case let downcasted as NSNull:
		property = convert(downcasted)
		return true
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

func downcast(inout property: NSNumber,value: AnyObject?) -> Bool {
	var optionalProperty : NSNumber?
	switch value {
	case let downcasted as NSNumber:
		optionalProperty = convert(downcasted)
	case let downcasted as NSNull:
		optionalProperty = convert(downcasted)
		return true
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

func downcast(inout property: NSNumber,value: AnyObject) -> Bool {
	var optionalProperty : NSNumber?
	switch value {
	case let downcasted as NSNumber:
		optionalProperty = convert(downcasted)
	case let downcasted as NSNull:
		optionalProperty = convert(downcasted)
		return true
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
