// Playground - noun: a place where people can play

import UIKit


func convert<T,U>(value : T) -> U? {
	if let converted = value as? U {
		return converted
	}
	return nil
}


// MARK: String -> Int

func convert(value : String) -> Int? {
	return NSString(string:value).integerValue
}

func reconvert<T,U>(value: T) -> U? {
	return convert(value)
}

func rereconvert<T,U>(value: T) -> U? {
	return reconvert(value)
}

//number = convert(true)!
//
//number = reconvert(true)!

let number: Int? = convert("22")


