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


let jsonString = "{ \"name\" : \"Antonio\",\"email\" : \"antonio@gmail.com\",\"available\" : false }"

var error : NSError?
if let dic = NSJSONSerialization.JSONObjectWithData(jsonString.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!, options: .MutableLeaves, error: &error) as? NSDictionary {
	let jsonValid = parse(&a.name,dic["name"], longerThan(5) || shorterThan(20)) &&
		parse(&a.email,"blah@pepe.com", isEmail) &&
		parse(&a.available,"true") &&
		parse(&a.requiredUrl,"http://www.google.com")
	
}



