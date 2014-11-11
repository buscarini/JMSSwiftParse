// Playground - noun: a place where people can play

import UIKit
import JMSSwiftParse

func convert<T,U>(value : T?) -> U? {
	if let converted = value as? U {
		return converted
	}
	return nil
}

func convert(value : String?) -> NSURL? {
	if let string = value {
		return NSURL(string: string)
	}
	return nil
}

public func testParse<T,U>(inout property: T, value: U?) -> Bool {
	let converted : T? = convert(value)
	if let valid = converted {
		return true
	}
	return false
}

func reconvert<T,U>(property: T?, value: U?) -> T? {
	let converted : T? = convert(value)
	return converted
}

//func reconvert(property: String?, value: NSURL?) -> NSURL? {
//	let converted : NSURL? = convert(value)
//	return converted
//}

let validUrlString : String? = "http://www.google.com"
let invalidUrlString = "blah"

var url : NSURL? = NSURL(string: "http://www.google.com")

var convertedUrl: NSURL? = convert(validUrlString)

var strictUrl : NSURL = NSURL(string: "http://www.google.com")!

reconvert(convertedUrl, validUrlString)

reconvert(strictUrl, validUrlString)

//testParse(&convertedUrl, validUrlString)

testParse(&url, validUrlString)

parse(&url, validUrlString)
