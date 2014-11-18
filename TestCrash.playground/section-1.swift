// Playground - noun: a place where people can play

import Cocoa

public protocol Convertible {}

extension String : Convertible {}
extension NSNumber : Convertible {}
extension NSValue : Convertible {}
extension String : Convertible {}

public func parse<T : Convertible,U : Convertible>(inout property: T, value: U,validate: (T)->Bool = { (val) in true }) -> Bool {
	return false
}

var value = "blah"
var property = "Blih"

//parse(&property,value)


