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

// MARK: Parse values

let a = TestClass()

let valid = parse(&a.name,"Pepe", longerThan(5) || shorterThan(20)) &&
			parse(&a.email,"blah@pepe.com", isEmail) &&
			parse(&a.available,"true") &&
			parse(&a.requiredUrl,"http://www.google.com")

a

// MARK: Parse JSON

let jsonString = "{ \"name\" : \"Antonio\",\"email\" : \"antonio@gmail.com\",\"available\" : \"TRUE\", \"url\" : \"http://www.google.com\", \"date\" : \"22.7.2010 10:02\",\"amount\" : \"22\", \"other_amount\" : \"33\" }"

var error : NSError?
let dic: AnyObject? = NSJSONSerialization.JSONObjectWithData(jsonString.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!, options: .MutableLeaves, error: &error)

if let validDic = dic as? NSDictionary {
	let jsonValid = parse(&a.name,validDic["name"], longerThan(8) || shorterThan(20))
					&& parse(&a.date,validDic["date"],"dd.M.yyyy HH:mm")
					&& parse(&a.email,validDic["email"], isEmail)
					&& parse(&a.available,validDic["available"])
					&& parse(&a.requiredUrl,validDic["url"])
					&& parse(&a.optionalUrl,validDic["url"])
					&& parse(&a.amount,validDic["amount"])
}
else {
	NSLog("No dictionary")
}


a

