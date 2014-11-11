// Playground - noun: a place where people can play

import UIKit
import JMSSwiftParse

class TestClass {
	var name = ""
	var email = ""
	var requiredUrl : NSURL = NSURL(string : "blah")!
	var optionalUrl : NSURL? = NSURL()
	var available = false
	var availableString = ""
	var amount = 0
	var date = NSDate()
}

let a = TestClass()

let valid = parse(&a.name,"Pepe", longerThan(5) || shorterThan(20)) &&
			parse(&a.email,"blah@pepe.com", isEmail) &&
			parse(&a.available,"true") &&
			parse(&a.requiredUrl,"http://www.google.com")

a

