//
//  validation.swift
//  JMSParse
//
//  Created by Jose Manuel Sánchez Peñarroja on 10/11/14.
//  Copyright (c) 2014 José Manuel Sánchez. All rights reserved.
//

import Foundation

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
