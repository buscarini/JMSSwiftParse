//
//  JMSSwiftParseTests.swift
//  JMSSwiftParseTests
//
//  Created by Jose Manuel Sánchez Peñarroja on 10/11/14.
//  Copyright (c) 2014 José Manuel Sánchez. All rights reserved.
//

import Foundation
import JMSSwiftParse
import XCTest

class TestClass {
	var requiredString = ""
	var optionalString : String?
	var email = ""
	var requiredUrl : NSURL = NSURL(string : "blah")!
	var optionalUrl : NSURL? = NSURL()
	var requiredBool = false
	var optionalBool : Bool?
	var availableString = ""
	var requiredInt = 0
	var optionalInt : Int? = 0
	var date = NSDate()
}

class JMSSwiftParseTests: XCTestCase {
	
	let object = TestClass()
	
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

	func testNull() {
		XCTAssertFalse(parse(&object.requiredString,NSNull()))
		XCTAssertTrue(parse(&object.optionalBool,NSNull()))
		XCTAssertTrue(object.optionalBool==nil)
	}
    
	func testRequiredString() {
		let name = "Pepe"
		let other = "Other"
		let optional : String? = "blah"
		
		XCTAssertTrue(parse(&object.requiredString,name))
		XCTAssertTrue(object.requiredString==name)
		
		object.requiredString = other
		
		XCTAssertTrue(parse(&object.requiredString,optional))
		XCTAssertTrue(object.requiredString==optional)

		object.requiredString = other
		
		XCTAssertTrue(parse(&object.requiredString,name,longerThan(3) && shorterThan(5)))
		XCTAssertTrue(object.requiredString==name)
		
		object.requiredString = other
		
		XCTAssertTrue(parse(&object.requiredString,optional,longerThan(3) && shorterThan(5)))
		XCTAssertTrue(object.requiredString==optional)
		
		object.requiredString = other
		
		XCTAssertFalse(parse(&object.requiredString,name,longerThan(5)))
		XCTAssertFalse(object.requiredString==name)
		
		XCTAssertTrue(parse(&object.requiredString,name,!longerThan(5)))
		XCTAssertTrue(object.requiredString==name)
		
		object.requiredString = other
		
		XCTAssertFalse(parse(&object.requiredString,optional,longerThan(5)))
		XCTAssertFalse(object.requiredString==optional)
		
		XCTAssertTrue(parse(&object.requiredString,optional,!longerThan(5)))
		XCTAssertTrue(object.requiredString==optional)
		
		object.requiredString = other
		
		XCTAssertTrue(parse(&object.requiredString,name,longerThan(5) || shorterThan(5)))
		XCTAssertTrue(object.requiredString==name)
	}
	
	func testOptionalString() {
		let name = "Pepe"
		let other = "Other"
		let optional : String? = "blah"
		
		XCTAssertTrue(parse(&object.optionalString,name))
		XCTAssertTrue(object.optionalString==name)
		
		object.optionalString = other
		
		XCTAssertTrue(parse(&object.optionalString,name,longerThan(3) && shorterThan(5)))
		XCTAssertTrue(object.optionalString==name)
		
		object.optionalString = other
		
		XCTAssertFalse(parse(&object.optionalString,name,longerThan(5)))
		XCTAssertFalse(object.optionalString==name)
		
		XCTAssertTrue(parse(&object.optionalString,name,!longerThan(5)))
		XCTAssertTrue(object.optionalString==name)
		
		object.optionalString = other
		
		XCTAssertTrue(parse(&object.optionalString,name,longerThan(5) || shorterThan(5)))
		XCTAssertTrue(object.optionalString==name)
	}
	
	
	func testNSString() {
		let name = NSString(string: "Pepe")
		let other = "blah"
		
		XCTAssertTrue(parse(&object.requiredString,name))
		XCTAssertTrue(object.requiredString==name)
		
		object.requiredString = other
		
		XCTAssertTrue(parse(&object.requiredString,name,longerThan(3) && shorterThan(5)))
		XCTAssertTrue(object.requiredString==name)
		
		object.requiredString = other
		
		XCTAssertFalse(parse(&object.requiredString,name,longerThan(5)))
		XCTAssertFalse(object.requiredString==name)
		
		XCTAssertTrue(parse(&object.requiredString,name,!longerThan(5)))
		XCTAssertTrue(object.requiredString==name)
		
		object.requiredString = other
		
		XCTAssertTrue(parse(&object.requiredString,name,longerThan(5) || shorterThan(5)))
		XCTAssertTrue(object.requiredString==name)
	}
	
	
	func testEmail() {
		let validEmail = "pepe@blah.com"
		let invalidEmail = "other"
		
		XCTAssertTrue(parse(&object.email,validEmail, isEmail))
		XCTAssertTrue(object.email==validEmail)
		
		XCTAssertTrue(parse(&object.email,NSString(string: validEmail), isEmail))
		XCTAssertTrue(object.email==validEmail)
		
		XCTAssertFalse(parse(&object.email,invalidEmail, isEmail))
		XCTAssertFalse(object.email==invalidEmail)

		XCTAssertFalse(parse(&object.email,NSString(string: invalidEmail), isEmail))
		XCTAssertFalse(object.email==invalidEmail)
	}
	
	
	func testUrl() {
		let validUrlString = "http://www.google.com"
		let validOptionalUrlString : String? = "http://www.google.com"
		let validOptionalUrlNSString : NSString? = NSString(string: "http://www.google.com")
		let invalidUrlString = "blah"
		
		XCTAssertFalse(parse(&object.optionalUrl,nil))
		XCTAssertFalse(parse(&object.requiredUrl,nil))
		
		XCTAssertTrue(parse(&object.optionalUrl,validUrlString))
		XCTAssertTrue(object.optionalUrl?.absoluteString==validUrlString)
		
		XCTAssertTrue(parse(&object.requiredUrl,validUrlString))
		XCTAssertTrue(object.requiredUrl.absoluteString==validUrlString)

		XCTAssertTrue(parse(&object.optionalUrl,NSString(string: validUrlString)))
		XCTAssertTrue(object.optionalUrl?.absoluteString==validUrlString)
		
		XCTAssertTrue(parse(&object.requiredUrl,NSString(string: validUrlString)))
		XCTAssertTrue(object.requiredUrl.absoluteString==validUrlString)
		
		XCTAssertTrue(parse(&object.optionalUrl,validOptionalUrlString))
		XCTAssertTrue(object.optionalUrl?.absoluteString==validOptionalUrlString)
		
		XCTAssertTrue(parse(&object.requiredUrl,validOptionalUrlString))
		XCTAssertTrue(object.requiredUrl.absoluteString==validOptionalUrlString)

		XCTAssertTrue(parse(&object.optionalUrl,validOptionalUrlNSString))
		XCTAssertTrue(object.optionalUrl?.absoluteString==validOptionalUrlNSString)
		
		XCTAssertTrue(parse(&object.requiredUrl,validOptionalUrlNSString))
		XCTAssertTrue(object.requiredUrl.absoluteString==validOptionalUrlNSString)
		
		XCTAssertTrue(parse(&object.optionalUrl,invalidUrlString))
		XCTAssertTrue(object.optionalUrl?.absoluteString==invalidUrlString)
		
		XCTAssertTrue(parse(&object.requiredUrl,invalidUrlString))
		XCTAssertTrue(object.requiredUrl.absoluteString==invalidUrlString)

		XCTAssertTrue(parse(&object.optionalUrl,NSString(string: invalidUrlString)))
		XCTAssertTrue(object.optionalUrl?.absoluteString==invalidUrlString)
		
		XCTAssertTrue(parse(&object.requiredUrl,NSString(string: invalidUrlString)))
		XCTAssertTrue(object.requiredUrl.absoluteString==invalidUrlString)
	}
	
	func testRequiredBool() {
		let trueBool = true
		let falseBool = false
		let trueNumber = NSNumber(bool: true)
		let falseNumber = NSNumber(bool: false)
		let trueString = "true"
		let falseString = "false"
		let trueString2 = "TRUE"
		let falseString2 = "FALSE"
		
		let optionalTrueString = "true"
		let optionalFalseString = "false"
		let optionalTrueString2 = "TRUE"
		let optionalFalseString2 = "FALSE"
				
		XCTAssertTrue(parse(&object.requiredBool,trueBool))
		XCTAssertTrue(object.requiredBool)
		XCTAssertTrue(parse(&object.requiredBool,falseBool))
		XCTAssertFalse(object.requiredBool)
		
		XCTAssertTrue(parse(&object.requiredBool,trueNumber))
		XCTAssertTrue(object.requiredBool)
		XCTAssertTrue(parse(&object.requiredBool,falseNumber))
		XCTAssertFalse(object.requiredBool)
		
		XCTAssertTrue(parse(&object.requiredBool,trueString))
		XCTAssertTrue(object.requiredBool)
		XCTAssertTrue(parse(&object.requiredBool,falseString))
		XCTAssertFalse(object.requiredBool)
		
		XCTAssertTrue(parse(&object.requiredBool,trueString2))
		XCTAssertTrue(object.requiredBool)
		XCTAssertTrue(parse(&object.requiredBool,falseString2))
		XCTAssertFalse(object.requiredBool)
		
		XCTAssertTrue(parse(&object.requiredBool,NSString(string: trueString)))
		XCTAssertTrue(object.requiredBool)
		XCTAssertTrue(parse(&object.requiredBool,NSString(string: falseString)))
		XCTAssertFalse(object.requiredBool)

		XCTAssertTrue(parse(&object.requiredBool,NSString(string: trueString2)))
		XCTAssertTrue(object.requiredBool)
		XCTAssertTrue(parse(&object.requiredBool,NSString(string: falseString2)))
		XCTAssertFalse(object.requiredBool)
		
		XCTAssertTrue(parse(&object.requiredBool,optionalTrueString))
		XCTAssertTrue(object.requiredBool)
		XCTAssertTrue(parse(&object.requiredBool,optionalFalseString))
		XCTAssertFalse(object.requiredBool)
		
		XCTAssertTrue(parse(&object.requiredBool,optionalTrueString2))
		XCTAssertTrue(object.requiredBool)
		XCTAssertTrue(parse(&object.requiredBool,optionalFalseString2))
		XCTAssertFalse(object.requiredBool)

		XCTAssertTrue(parse(&object.requiredString,true))
		XCTAssertTrue(object.requiredString=="true")
		XCTAssertTrue(parse(&object.requiredString,false))
		XCTAssertTrue(object.requiredString=="false")

		XCTAssertTrue(parse(&object.optionalString,true))
		XCTAssertTrue(object.optionalString=="true")
		XCTAssertTrue(parse(&object.optionalString,false))
		XCTAssertTrue(object.optionalString=="false")
	}
	
	func testOptionalBool() {
		let trueBool = true
		let falseBool = false
		let optionalTrueBool : Bool? = true
		let optionalFalseBool : Bool? = false
		let trueNumber = NSNumber(bool: true)
		let falseNumber = NSNumber(bool: false)
		let trueString = "true"
		let falseString = "false"
		let trueString2 = "TRUE"
		let falseString2 = "FALSE"
		
		let optionalTrueString = "true"
		let optionalFalseString = "false"
		let optionalTrueString2 = "TRUE"
		let optionalFalseString2 = "FALSE"
		
		XCTAssertTrue(parse(&object.optionalBool,trueBool))
		XCTAssertTrue(object.optionalBool!)
		XCTAssertTrue(parse(&object.optionalBool,falseBool))
		XCTAssertFalse(object.optionalBool!)
		
		XCTAssertTrue(parse(&object.optionalBool,trueNumber))
		XCTAssertTrue(object.optionalBool!)
		XCTAssertTrue(parse(&object.optionalBool,falseNumber))
		XCTAssertFalse(object.optionalBool!)
		
		XCTAssertTrue(parse(&object.optionalBool,trueString))
		XCTAssertTrue(object.optionalBool!)
		XCTAssertTrue(parse(&object.optionalBool,falseString))
		XCTAssertFalse(object.optionalBool!)
		
		XCTAssertTrue(parse(&object.optionalBool,trueString2))
		XCTAssertTrue(object.optionalBool!)
		XCTAssertTrue(parse(&object.optionalBool,falseString2))
		XCTAssertFalse(object.optionalBool!)
		
		XCTAssertTrue(parse(&object.optionalBool,NSString(string: trueString)))
		XCTAssertTrue(object.optionalBool!)
		XCTAssertTrue(parse(&object.optionalBool,NSString(string: falseString)))
		XCTAssertFalse(object.optionalBool!)

		XCTAssertTrue(parse(&object.optionalBool,NSString(string: trueString2)))
		XCTAssertTrue(object.optionalBool!)
		XCTAssertTrue(parse(&object.optionalBool,NSString(string: falseString2)))
		XCTAssertFalse(object.optionalBool!)
		
		XCTAssertTrue(parse(&object.optionalBool,optionalTrueString))
		XCTAssertTrue(object.optionalBool!)
		XCTAssertTrue(parse(&object.optionalBool,optionalFalseString))
		XCTAssertFalse(object.optionalBool!)
		
		XCTAssertTrue(parse(&object.optionalBool,optionalTrueString2))
		XCTAssertTrue(object.optionalBool!)
		XCTAssertTrue(parse(&object.optionalBool,optionalFalseString2))
		XCTAssertFalse(object.optionalBool!)

		XCTAssertTrue(parse(&object.requiredString,optionalTrueBool))
		XCTAssertTrue(object.requiredString=="true")
		XCTAssertTrue(parse(&object.requiredString,optionalFalseBool))
		XCTAssertTrue(object.requiredString=="false")

		XCTAssertTrue(parse(&object.optionalString,optionalTrueBool))
		XCTAssertTrue(object.optionalString=="true")
		XCTAssertTrue(parse(&object.optionalString,optionalFalseBool))
		XCTAssertTrue(object.optionalString=="false")
	}
	
	
	func testRequiredInt() {
		let positiveInt = 33
		let negativeInt = -45
		let optionalPositiveInt : Int? = 33
		let optionalNegativeInt : Int? = -45
		let positiveNumber = NSNumber(int: 10)
		let negativeNumber = NSNumber(int: -50)
		let positiveIntString = "33"
		let negativeIntString = "-45"
		let positiveIntNSString = NSString(string:"33")
		let negativeIntNSString = NSString(string:"-45")
		
		// Int
		
		XCTAssertTrue(parse(&object.requiredInt, positiveInt))
		XCTAssertTrue(object.requiredInt==positiveInt)
		
		XCTAssertTrue(parse(&object.requiredInt, negativeInt))
		XCTAssertTrue(object.requiredInt==negativeInt)
		
		XCTAssertFalse(parse(&object.requiredInt, positiveInt, greaterThan(40)))
		XCTAssertFalse(object.requiredInt==positiveInt)
		
		XCTAssertTrue(parse(&object.requiredInt, positiveInt, smallerThanOrEqual(33)))
		XCTAssertTrue(object.requiredInt==positiveInt)
		
		XCTAssertFalse(parse(&object.requiredInt, negativeInt, equal(4)))
		XCTAssertFalse(object.requiredInt==negativeInt)
		
		XCTAssertTrue(parse(&object.requiredInt, negativeInt, equal(-45)))
		XCTAssertTrue(object.requiredInt==negativeInt)
		
		XCTAssertTrue(parse(&object.requiredInt, positiveInt, !equal(40)))
		XCTAssertTrue(object.requiredInt==positiveInt)
		
		// NSNumber
		
		XCTAssertTrue(parse(&object.requiredInt, positiveNumber))
		XCTAssertTrue(object.requiredInt==positiveNumber.integerValue)
		
		XCTAssertTrue(parse(&object.requiredInt, negativeNumber))
		XCTAssertTrue(object.requiredInt==negativeNumber.integerValue)
		
		XCTAssertFalse(parse(&object.requiredInt, positiveNumber, greaterThan(40)))
		XCTAssertFalse(object.requiredInt==positiveNumber.integerValue)
		
		XCTAssertTrue(parse(&object.requiredInt, positiveNumber, smallerThanOrEqual(33)))
		XCTAssertTrue(object.requiredInt==positiveNumber.integerValue)
		
		XCTAssertFalse(parse(&object.requiredInt, negativeNumber, equal(4)))
		XCTAssertFalse(object.requiredInt==negativeNumber.integerValue)
		
		XCTAssertTrue(parse(&object.requiredInt, negativeNumber, equal(-50)))
		XCTAssertTrue(object.requiredInt==negativeNumber.integerValue)
		
		XCTAssertTrue(parse(&object.requiredInt, positiveNumber, !equal(40)))
		XCTAssertTrue(object.requiredInt==positiveNumber.integerValue)
		
		// String
		XCTAssertTrue(parse(&object.requiredInt, positiveIntString))
		XCTAssertTrue(object.requiredInt==positiveInt)
		
		XCTAssertTrue(parse(&object.requiredInt, negativeIntString))
		XCTAssertTrue(object.requiredInt==negativeInt)
		
		XCTAssertFalse(parse(&object.requiredInt, positiveIntString, greaterThan(40)))
		XCTAssertFalse(object.requiredInt==positiveInt)
		
		XCTAssertTrue(parse(&object.requiredInt, positiveIntString, smallerThanOrEqual(33)))
		XCTAssertTrue(object.requiredInt==positiveInt)
		
		XCTAssertFalse(parse(&object.requiredInt, negativeIntString, equal(4)))
		XCTAssertFalse(object.requiredInt==negativeInt)
		
		XCTAssertTrue(parse(&object.requiredInt, negativeIntString, equal(-45)))
		XCTAssertTrue(object.requiredInt==negativeInt)
		
		XCTAssertTrue(parse(&object.requiredInt, positiveIntString, !equal(40)))
		XCTAssertTrue(object.requiredInt==positiveInt)
		
		// NSString
		XCTAssertTrue(parse(&object.requiredInt, positiveIntNSString))
		XCTAssertTrue(object.requiredInt==positiveInt)
		
		XCTAssertTrue(parse(&object.requiredInt, negativeIntNSString))
		XCTAssertTrue(object.requiredInt==negativeInt)
		
		XCTAssertFalse(parse(&object.requiredInt, positiveIntNSString, greaterThan(40)))
		XCTAssertFalse(object.requiredInt==positiveInt)
		
		XCTAssertTrue(parse(&object.requiredInt, positiveIntNSString, smallerThanOrEqual(33)))
		XCTAssertTrue(object.requiredInt==positiveInt)
		
		XCTAssertFalse(parse(&object.requiredInt, negativeIntNSString, equal(4)))
		XCTAssertFalse(object.requiredInt==negativeInt)
		
		XCTAssertTrue(parse(&object.requiredInt, negativeIntNSString, equal(-45)))
		XCTAssertTrue(object.requiredInt==negativeInt)
		
		XCTAssertTrue(parse(&object.requiredInt, positiveIntNSString, !equal(40)))
		XCTAssertTrue(object.requiredInt==positiveInt)
	}

	func testOptionalInt() {
		let positiveInt = 33
		let negativeInt = -45
		let optionalPositiveInt : Int? = 33
		let optionalNegativeInt : Int? = -45
		let positiveNumber = NSNumber(int: 10)
		let negativeNumber = NSNumber(int: -50)
		let positiveIntString = "33"
		let negativeIntString = "-45"
		let positiveIntNSString = NSString(string:"33")
		let negativeIntNSString = NSString(string:"-45")
		
		// Int
		
		XCTAssertTrue(parse(&object.optionalInt, positiveInt))
		XCTAssertTrue(object.optionalInt==positiveInt)
		
		XCTAssertTrue(parse(&object.optionalInt, negativeInt))
		XCTAssertTrue(object.optionalInt==negativeInt)
		
		XCTAssertFalse(parse(&object.optionalInt, positiveInt, greaterThan(40)))
		XCTAssertFalse(object.optionalInt==positiveInt)
		
		XCTAssertTrue(parse(&object.optionalInt, positiveInt, smallerThanOrEqual(33)))
		XCTAssertTrue(object.optionalInt==positiveInt)
		
		XCTAssertFalse(parse(&object.optionalInt, negativeInt, equal(4)))
		XCTAssertFalse(object.optionalInt==negativeInt)
		
		XCTAssertTrue(parse(&object.optionalInt, negativeInt, equal(-45)))
		XCTAssertTrue(object.optionalInt==negativeInt)
		
		XCTAssertTrue(parse(&object.optionalInt, positiveInt, !equal(40)))
		XCTAssertTrue(object.optionalInt==positiveInt)
		
		// NSNumber
		
		XCTAssertTrue(parse(&object.optionalInt, positiveNumber))
		XCTAssertTrue(object.optionalInt==positiveNumber.integerValue)
		
		XCTAssertTrue(parse(&object.optionalInt, negativeNumber))
		XCTAssertTrue(object.optionalInt==negativeNumber.integerValue)
		
		XCTAssertFalse(parse(&object.optionalInt, positiveNumber, greaterThan(40)))
		XCTAssertFalse(object.optionalInt==positiveNumber.integerValue)
		
		XCTAssertTrue(parse(&object.optionalInt, positiveNumber, smallerThanOrEqual(33)))
		XCTAssertTrue(object.optionalInt==positiveNumber.integerValue)
		
		XCTAssertFalse(parse(&object.optionalInt, negativeNumber, equal(4)))
		XCTAssertFalse(object.optionalInt==negativeNumber.integerValue)
		
		XCTAssertTrue(parse(&object.optionalInt, negativeNumber, equal(-50)))
		XCTAssertTrue(object.optionalInt==negativeNumber.integerValue)
		
		XCTAssertTrue(parse(&object.optionalInt, positiveNumber, !equal(40)))
		XCTAssertTrue(object.optionalInt==positiveNumber.integerValue)
		
		// String
		XCTAssertTrue(parse(&object.optionalInt, positiveIntString))
		XCTAssertTrue(object.optionalInt==positiveInt)
		
		XCTAssertTrue(parse(&object.optionalInt, negativeIntString))
		XCTAssertTrue(object.optionalInt==negativeInt)
		
		XCTAssertFalse(parse(&object.optionalInt, positiveIntString, greaterThan(40)))
		XCTAssertFalse(object.optionalInt==positiveInt)
		
		XCTAssertTrue(parse(&object.optionalInt, positiveIntString, smallerThanOrEqual(33)))
		XCTAssertTrue(object.optionalInt==positiveInt)
		
		XCTAssertFalse(parse(&object.optionalInt, negativeIntString, equal(4)))
		XCTAssertFalse(object.optionalInt==negativeInt)
		
		XCTAssertTrue(parse(&object.optionalInt, negativeIntString, equal(-45)))
		XCTAssertTrue(object.optionalInt==negativeInt)
		
		XCTAssertTrue(parse(&object.optionalInt, positiveIntString, !equal(40)))
		XCTAssertTrue(object.optionalInt==positiveInt)
		
		// NSString
		XCTAssertTrue(parse(&object.optionalInt, positiveIntNSString))
		XCTAssertTrue(object.optionalInt==positiveInt)
		
		XCTAssertTrue(parse(&object.optionalInt, negativeIntNSString))
		XCTAssertTrue(object.optionalInt==negativeInt)
		
		XCTAssertFalse(parse(&object.optionalInt, positiveIntNSString, greaterThan(40)))
		XCTAssertFalse(object.optionalInt==positiveInt)
		
		XCTAssertTrue(parse(&object.optionalInt, positiveIntNSString, smallerThanOrEqual(33)))
		XCTAssertTrue(object.optionalInt==positiveInt)
		
		XCTAssertFalse(parse(&object.optionalInt, negativeIntNSString, equal(4)))
		XCTAssertFalse(object.optionalInt==negativeInt)
		
		XCTAssertTrue(parse(&object.optionalInt, negativeIntNSString, equal(-45)))
		XCTAssertTrue(object.optionalInt==negativeInt)
		
		XCTAssertTrue(parse(&object.optionalInt, positiveIntNSString, !equal(40)))
		XCTAssertTrue(object.optionalInt==positiveInt)
	}
	
	func testDate() {
		var date = NSDate()
		let dateString = "24:01:2012 11:55:58"
		let dateFormat = "dd:MM:yyyy HH:mm:ss"
		var parsedString = ""
		
		XCTAssertTrue(parse(&date, dateString,dateFormat))

		let gregorian = NSCalendar(calendarIdentifier: NSGregorianCalendar)
		let dateComponents = gregorian?.components(.CalendarUnitDay | .CalendarUnitMonth | .CalendarUnitYear | .CalendarUnitHour | .CalendarUnitMinute | .CalendarUnitSecond, fromDate: date)
		XCTAssertNotNil(dateComponents)
		XCTAssertTrue(dateComponents?.day==24)
		XCTAssertTrue(dateComponents?.month==1)
		XCTAssertTrue(dateComponents?.year==2012)
		XCTAssertTrue(dateComponents?.hour==11)
		XCTAssertTrue(dateComponents?.minute==55)
		XCTAssertTrue(dateComponents?.second==58)
		
		XCTAssertTrue(parse(&parsedString,date,dateFormat))
		XCTAssertTrue(dateString==parsedString)
		
		self.measureBlock {
			for i in 0...1000 {
				parse(&date, dateString,dateFormat)
				parse(&parsedString,date,dateFormat)
			}
		}
	}
	
	func testAnyObject() {
		let rawName: AnyObject? = "Antonio"
		var name = ""
		
		XCTAssertTrue(parse(&name, rawName))
		
	}
}


