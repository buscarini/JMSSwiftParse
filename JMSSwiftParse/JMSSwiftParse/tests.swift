//
//  tests.swift
//  JMSSwiftParse
//
//  Created by Jose Manuel Sánchez Peñarroja on 12/11/14.
//  Copyright (c) 2014 José Manuel Sánchez. All rights reserved.
//

import Foundation

public protocol Convertible {}

extension String : Convertible {}
extension NSNumber : Convertible {}
extension NSValue : Convertible {}
extension String : Convertible {}

public func parse<T : Convertible,U : Convertible>(inout property: T, value: U,validate: (T)->Bool = { (val) in true }) -> Bool {
	return false
}
