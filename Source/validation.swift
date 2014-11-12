//
//  validation.swift
//  JMSSwiftParse
//
//  Created by Jose Manuel Sánchez Peñarroja on 10/11/14.
//  Copyright (c) 2014 José Manuel Sánchez. All rights reserved.
//

import Foundation

// MARK: Size
public func equal<T: Equatable>(value : T) -> (T) -> Bool {
	return { $0==value }
}

public func different<T: Equatable>(value : T) -> (T) -> Bool {
	return { !($0==value) }
}

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


// MARK: Length

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

/// MARK : Semantics

public func isEmail(string: String) -> Bool {
	let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
	let emailTestPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
	if let predicate = emailTestPredicate {
		return predicate.evaluateWithObject(string)
	}
	return false
}

// MARK: Function operators

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

