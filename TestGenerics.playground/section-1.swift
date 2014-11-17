// Playground - noun: a place where people can play

import UIKit


func convert<T,U>(value : T) -> U? {
	if let converted = value as? U {
		return converted
	}
	return nil
}


// MARK: Bool <-> NSNumber

func convert(value : NSNumber) -> Bool? {
	return value.boolValue
}

func convert(value : Bool) -> NSNumber? {
	return NSNumber(bool: value)
}

func reconvert<T,U>(value: T) -> U? {
	return convert(value)
}

var number = NSNumber(integer: 2)

number = convert(true)!

number = reconvert(true)!


