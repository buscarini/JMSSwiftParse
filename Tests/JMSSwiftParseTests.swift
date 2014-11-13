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
	var amount = 0
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
		let invalidUrlString = "blah"
		
		XCTAssertTrue(parse(&object.optionalUrl,validUrlString))
		XCTAssertTrue(object.optionalUrl?.absoluteString==validUrlString)
		
		XCTAssertTrue(parse(&object.requiredUrl,validUrlString))
		XCTAssertTrue(object.requiredUrl.absoluteString==validUrlString)

		XCTAssertTrue(parse(&object.optionalUrl,NSString(string: validUrlString)))
		XCTAssertTrue(object.optionalUrl?.absoluteString==validUrlString)
		
		XCTAssertTrue(parse(&object.requiredUrl,NSString(string: validUrlString)))
		XCTAssertTrue(object.requiredUrl.absoluteString==validUrlString)
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

		XCTAssertTrue(parse(&object.availableString,true))
		XCTAssertTrue(object.availableString=="true")
		XCTAssertTrue(parse(&object.availableString,false))
		XCTAssertTrue(object.availableString=="false")
	}
	
	/*func testOptionalBool() {
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

		XCTAssertTrue(parse(&object.availableString,true))
		XCTAssertTrue(object.availableString=="true")
		XCTAssertTrue(parse(&object.availableString,false))
		XCTAssertTrue(object.availableString=="false")
	}*/
	
	/*
	func testInt() {
		let positiveInt = 33
		let negativeInt = -45
		let positiveNumber = NSNumber(int: 10)
		let negativeNumber = NSNumber(int: -50)
		let positiveIntString = "33"
		let negativeIntString = "-45"
		let positiveIntNSString = NSString(string:"33")
		let negativeIntNSString = NSString(string:"-45")
		
		// Int
		
		XCTAssertTrue(parse(&object.amount, positiveInt))
		XCTAssertTrue(object.amount==positiveInt)
		
		XCTAssertTrue(parse(&object.amount, negativeInt))
		XCTAssertTrue(object.amount==negativeInt)
		
		XCTAssertFalse(parse(&object.amount, positiveInt, greaterThan(40)))
		XCTAssertFalse(object.amount==positiveInt)
		
		XCTAssertTrue(parse(&object.amount, positiveInt, smallerThanOrEqual(33)))
		XCTAssertTrue(object.amount==positiveInt)
		
		XCTAssertFalse(parse(&object.amount, negativeInt, equal(4)))
		XCTAssertFalse(object.amount==negativeInt)
		
		XCTAssertTrue(parse(&object.amount, negativeInt, equal(-45)))
		XCTAssertTrue(object.amount==negativeInt)
		
		XCTAssertTrue(parse(&object.amount, positiveInt, !equal(40)))
		XCTAssertTrue(object.amount==positiveInt)
		
		// NSNumber
		
		XCTAssertTrue(parse(&object.amount, positiveNumber))
		XCTAssertTrue(object.amount==positiveNumber.integerValue)
		
		XCTAssertTrue(parse(&object.amount, negativeNumber))
		XCTAssertTrue(object.amount==negativeNumber.integerValue)
		
		XCTAssertFalse(parse(&object.amount, positiveNumber, greaterThan(40)))
		XCTAssertFalse(object.amount==positiveNumber.integerValue)
		
		XCTAssertTrue(parse(&object.amount, positiveNumber, smallerThanOrEqual(33)))
		XCTAssertTrue(object.amount==positiveNumber.integerValue)
		
		XCTAssertFalse(parse(&object.amount, negativeNumber, equal(4)))
		XCTAssertFalse(object.amount==negativeNumber.integerValue)
		
		XCTAssertTrue(parse(&object.amount, negativeNumber, equal(-50)))
		XCTAssertTrue(object.amount==negativeNumber.integerValue)
		
		XCTAssertTrue(parse(&object.amount, positiveNumber, !equal(40)))
		XCTAssertTrue(object.amount==positiveNumber.integerValue)
		
		// String
		XCTAssertTrue(parse(&object.amount, positiveIntString))
		XCTAssertTrue(object.amount==positiveInt)
		
		XCTAssertTrue(parse(&object.amount, negativeIntString))
		XCTAssertTrue(object.amount==negativeInt)
		
		XCTAssertFalse(parse(&object.amount, positiveIntString, greaterThan(40)))
		XCTAssertFalse(object.amount==positiveInt)
		
		XCTAssertTrue(parse(&object.amount, positiveIntString, smallerThanOrEqual(33)))
		XCTAssertTrue(object.amount==positiveInt)
		
		XCTAssertFalse(parse(&object.amount, negativeIntString, equal(4)))
		XCTAssertFalse(object.amount==negativeInt)
		
		XCTAssertTrue(parse(&object.amount, negativeIntString, equal(-45)))
		XCTAssertTrue(object.amount==negativeInt)
		
		XCTAssertTrue(parse(&object.amount, positiveIntString, !equal(40)))
		XCTAssertTrue(object.amount==positiveInt)
		
		// NSString
		XCTAssertTrue(parse(&object.amount, positiveIntNSString))
		XCTAssertTrue(object.amount==positiveInt)
		
		XCTAssertTrue(parse(&object.amount, negativeIntNSString))
		XCTAssertTrue(object.amount==negativeInt)
		
		XCTAssertFalse(parse(&object.amount, positiveIntNSString, greaterThan(40)))
		XCTAssertFalse(object.amount==positiveInt)
		
		XCTAssertTrue(parse(&object.amount, positiveIntNSString, smallerThanOrEqual(33)))
		XCTAssertTrue(object.amount==positiveInt)
		
		XCTAssertFalse(parse(&object.amount, negativeIntNSString, equal(4)))
		XCTAssertFalse(object.amount==negativeInt)
		
		XCTAssertTrue(parse(&object.amount, negativeIntNSString, equal(-45)))
		XCTAssertTrue(object.amount==negativeInt)
		
		XCTAssertTrue(parse(&object.amount, positiveIntNSString, !equal(40)))
		XCTAssertTrue(object.amount==positiveInt)
	}*/
    
}
