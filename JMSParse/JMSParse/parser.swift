//
//  JMSSwiftParse.swift
//  JMSParse
//
//  Created by Jose Manuel Sánchez Peñarroja on 10/11/14.
//  Copyright (c) 2014 José Manuel Sánchez. All rights reserved.
//

import Foundation

/// MARk: Parsers

func parse<T>(inout property: T, value: AnyObject?,validate: (T)->Bool) -> Bool {
	if let converted : T = convert(value) {
		if validate(converted) {
			property = converted
			return true
		}
	}
	
	return false
}

func parse<T>(inout property: T, value: AnyObject?) -> Bool {
	return parse(&property, value) { (val) in true }
}