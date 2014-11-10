//
//  validation.swift
//  JMSSwiftParse
//
//  Created by Jose Manuel Sánchez Peñarroja on 10/11/14.
//  Copyright (c) 2014 José Manuel Sánchez. All rights reserved.
//

import Foundation

/// MARK: Validators


/// MARK: Size
public func equal<T: Equatable>(min : T) -> (T) -> Bool {
	return { $0==min }
}

//public func different<T: Equatable>(min : T) -> (T) -> Bool {
//	return { $0!=min }
//}

public func smallerThan<T: Comparable>(min : T) -> (T) -> Bool {
	return { $0<min }
}

public func smallerThanOrEqual<T: Comparable>(min : T) -> (T) -> Bool {
	return { $0<=min }
}

public func greaterThan<T: Comparable>(min : T) -> (T) -> Bool {
	return { $0>min }
}

public func greaterThanOrEqual<T: Comparable>(min : T) -> (T) -> Bool {
	return { $0>=min }
}


/// MARK: Length

public func compareLength(length: Int, operation: (Int,Int) -> Bool ) -> (String) -> Bool {
	return { operation($0.lengthOfBytesUsingEncoding(NSUTF8StringEncoding),length) }
}

public func compareLength(length: Int, operation: (Int,Int) -> Bool ) -> (NSString) -> Bool {
	return { operation($0.length,length) }
}

public func longerThan(length: Int) -> (String) -> Bool {
	return compareLength(length, >)
}

public func longerThanOrEqual(length: Int) -> (String) -> Bool {
	return compareLength(length, >=)
}

public func shorterThan(length: Int) -> (String) -> Bool {
	return compareLength(length, <)
}

public func shorterThanOrEqual(length: Int) -> (String) -> Bool {
	return compareLength(length, <=)
}

public func longerThan(length: Int) -> (NSString) -> Bool {
	return compareLength(length, >)
}

public func longerThanOrEqual(length: Int) -> (NSString) -> Bool {
	return compareLength(length, >=)
}

public func shorterThan(length: Int) -> (NSString) -> Bool {
	return compareLength(length, <)
}

public func shorterThanOrEqual(length: Int) -> (NSString) -> Bool {
	return compareLength(length, <=)
}

/// MARK : Semantics

public func isEmail() -> (NSString) -> Bool {
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

public func isEmail() -> (String) -> Bool {
	return { (string) in return isEmail()(NSString(string: string)) }
}

/// MARK: Function operators

public func &&<T>(lhs: (T) -> Bool,rhs : (T) -> Bool) -> (T) -> Bool {
	return {
		(val) in
		if !lhs(val){
			return false
		}
		return rhs(val)
	}
}

public func ||<T>(lhs: (T) -> Bool,rhs : (T) -> Bool) -> (T) -> Bool {
	return {
		(val) in
		if lhs(val){
			return true
		}
		return rhs(val)
	}
}

prefix public func !<T>(validator: (T) -> Bool) -> (T) -> Bool {
	return { !validator($0) }
}

