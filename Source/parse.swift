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