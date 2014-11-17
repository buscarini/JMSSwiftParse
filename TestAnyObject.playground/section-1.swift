// Playground - noun: a place where people can play

import Foundation

func convert<T>(value: AnyObject?) -> T? {
	switch value {
	case let downcasted as T:
		return downcasted
	default:
		return nil
	}
}

let rawString = NSString(string: "blah")

var string: String = convert(rawString as AnyObject?)!
