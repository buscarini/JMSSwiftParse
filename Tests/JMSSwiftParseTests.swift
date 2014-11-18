//
//  JMSSwiftParseTests.swift
//  JMSSwiftParseTests
//
//  Created by Jose Manuel Sánchez Peñarroja on 10/11/14.
//  Copyright (c) 2014 José Manuel Sánchez. All rights reserved.
//

import UIKit
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
	var requiredDouble = 0.0
	var optionalDouble : Double? = 0.0

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
		XCTAssertFalse(parse(&object.optionalBool,NSNull()))
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
	
	func testRequiredDouble() {
		let positiveDouble = 33.0
		let negativeDouble = -45.0
		let optionalPositiveDouble : Double? = 33.0
		let optionalNegativeDouble : Double? = -45.0
		let positiveNumber = NSNumber(double: 10.0)
		let negativeNumber = NSNumber(double: -50.0)
		let positiveDoubleString = "33.0"
		let negativeDoubleString = "-45.0"
		let positiveDoubleNSString = NSString(string:"33.0")
		let negativeDoubleNSString = NSString(string:"-45.0")
		
		// Double
		
		XCTAssertTrue(parse(&object.requiredDouble, positiveDouble))
		XCTAssertTrue(object.requiredDouble==positiveDouble)
		
		XCTAssertTrue(parse(&object.requiredDouble, negativeDouble))
		XCTAssertTrue(object.requiredDouble==negativeDouble)
		
		XCTAssertFalse(parse(&object.requiredDouble, positiveDouble, greaterThan(40.0)))
		XCTAssertFalse(object.requiredDouble==positiveDouble)
		
		XCTAssertTrue(parse(&object.requiredDouble, positiveDouble, smallerThanOrEqual(33.0)))
		XCTAssertTrue(object.requiredDouble==positiveDouble)
		
		XCTAssertFalse(parse(&object.requiredDouble, negativeDouble, equal(4)))
		XCTAssertFalse(object.requiredDouble==negativeDouble)
		
		XCTAssertTrue(parse(&object.requiredDouble, negativeDouble, equal(-45.0)))
		XCTAssertTrue(object.requiredDouble==negativeDouble)
		
		XCTAssertTrue(parse(&object.requiredDouble, positiveDouble, !equal(40.0)))
		XCTAssertTrue(object.requiredDouble==positiveDouble)
		
		// NSNumber
		
		XCTAssertTrue(parse(&object.requiredDouble, positiveNumber))
		XCTAssertTrue(object.requiredDouble==positiveNumber.doubleValue)
		
		XCTAssertTrue(parse(&object.requiredDouble, negativeNumber))
		XCTAssertTrue(object.requiredDouble==negativeNumber.doubleValue)
		
		XCTAssertFalse(parse(&object.requiredDouble, positiveNumber, greaterThan(40.0)))
		XCTAssertFalse(object.requiredDouble==positiveNumber.doubleValue)
		
		XCTAssertTrue(parse(&object.requiredDouble, positiveNumber, smallerThanOrEqual(33.0)))
		XCTAssertTrue(object.requiredDouble==positiveNumber.doubleValue)
		
		XCTAssertFalse(parse(&object.requiredDouble, negativeNumber, equal(4)))
		XCTAssertFalse(object.requiredDouble==negativeNumber.doubleValue)
		
		XCTAssertTrue(parse(&object.requiredDouble, negativeNumber, equal(-50)))
		XCTAssertTrue(object.requiredDouble==negativeNumber.doubleValue)
		
		XCTAssertTrue(parse(&object.requiredDouble, positiveNumber, !equal(40.0)))
		XCTAssertTrue(object.requiredDouble==positiveNumber.doubleValue)
		
		// String
		XCTAssertTrue(parse(&object.requiredDouble, positiveDoubleString))
		XCTAssertTrue(object.requiredDouble==positiveDouble)
		
		XCTAssertTrue(parse(&object.requiredDouble, negativeDoubleString))
		XCTAssertTrue(object.requiredDouble==negativeDouble)
		
		XCTAssertFalse(parse(&object.requiredDouble, positiveDoubleString, greaterThan(40.0)))
		XCTAssertFalse(object.requiredDouble==positiveDouble)
		
		XCTAssertTrue(parse(&object.requiredDouble, positiveDoubleString, smallerThanOrEqual(33.0)))
		XCTAssertTrue(object.requiredDouble==positiveDouble)
		
		XCTAssertFalse(parse(&object.requiredDouble, negativeDoubleString, equal(4)))
		XCTAssertFalse(object.requiredDouble==negativeDouble)
		
		XCTAssertTrue(parse(&object.requiredDouble, negativeDoubleString, equal(-45.0)))
		XCTAssertTrue(object.requiredDouble==negativeDouble)
		
		XCTAssertTrue(parse(&object.requiredDouble, positiveDoubleString, !equal(40.0)))
		XCTAssertTrue(object.requiredDouble==positiveDouble)
		
		// NSString
		XCTAssertTrue(parse(&object.requiredDouble, positiveDoubleNSString))
		XCTAssertTrue(object.requiredDouble==positiveDouble)
		
		XCTAssertTrue(parse(&object.requiredDouble, negativeDoubleNSString))
		XCTAssertTrue(object.requiredDouble==negativeDouble)
		
		XCTAssertFalse(parse(&object.requiredDouble, positiveDoubleNSString, greaterThan(40.0)))
		XCTAssertFalse(object.requiredDouble==positiveDouble)
		
		XCTAssertTrue(parse(&object.requiredDouble, positiveDoubleNSString, smallerThanOrEqual(33.0)))
		XCTAssertTrue(object.requiredDouble==positiveDouble)
		
		XCTAssertFalse(parse(&object.requiredDouble, negativeDoubleNSString, equal(4)))
		XCTAssertFalse(object.requiredDouble==negativeDouble)
		
		XCTAssertTrue(parse(&object.requiredDouble, negativeDoubleNSString, equal(-45.0)))
		XCTAssertTrue(object.requiredDouble==negativeDouble)
		
		XCTAssertTrue(parse(&object.requiredDouble, positiveDoubleNSString, !equal(40.0)))
		XCTAssertTrue(object.requiredDouble==positiveDouble)
	}

	func testOptionalDouble() {
		let positiveDouble = 33.0
		let negativeDouble = -45.0
		let optionalPositiveDouble : Double? = 33.0
		let optionalNegativeDouble : Double? = -45.0
		let positiveNumber = NSNumber(double: 10.0)
		let negativeNumber = NSNumber(double: -50.0)
		let positiveDoubleString = "33.0"
		let negativeDoubleString = "-45.0"
		let positiveDoubleNSString = NSString(string:"33.0")
		let negativeDoubleNSString = NSString(string:"-45.0")
		
		// Double
		
		XCTAssertTrue(parse(&object.optionalDouble, positiveDouble))
		XCTAssertTrue(object.optionalDouble==positiveDouble)
		
		XCTAssertTrue(parse(&object.optionalDouble, negativeDouble))
		XCTAssertTrue(object.optionalDouble==negativeDouble)
		
		XCTAssertFalse(parse(&object.optionalDouble, positiveDouble, greaterThan(40)))
		XCTAssertFalse(object.optionalDouble==positiveDouble)
		
		XCTAssertTrue(parse(&object.optionalDouble, positiveDouble, smallerThanOrEqual(33)))
		XCTAssertTrue(object.optionalDouble==positiveDouble)
		
		XCTAssertFalse(parse(&object.optionalDouble, negativeDouble, equal(4)))
		XCTAssertFalse(object.optionalDouble==negativeDouble)
		
		XCTAssertTrue(parse(&object.optionalDouble, negativeDouble, equal(-45)))
		XCTAssertTrue(object.optionalDouble==negativeDouble)
		
		XCTAssertTrue(parse(&object.optionalDouble, positiveDouble, !equal(40)))
		XCTAssertTrue(object.optionalDouble==positiveDouble)
		
		// NSNumber
		
		XCTAssertTrue(parse(&object.optionalDouble, positiveNumber))
		XCTAssertTrue(object.optionalDouble==positiveNumber.doubleValue)
		
		XCTAssertTrue(parse(&object.optionalDouble, negativeNumber))
		XCTAssertTrue(object.optionalDouble==negativeNumber.doubleValue)
		
		XCTAssertFalse(parse(&object.optionalDouble, positiveNumber, greaterThan(40)))
		XCTAssertFalse(object.optionalDouble==positiveNumber.doubleValue)
		
		XCTAssertTrue(parse(&object.optionalDouble, positiveNumber, smallerThanOrEqual(33)))
		XCTAssertTrue(object.optionalDouble==positiveNumber.doubleValue)
		
		XCTAssertFalse(parse(&object.optionalDouble, negativeNumber, equal(4)))
		XCTAssertFalse(object.optionalDouble==negativeNumber.doubleValue)
		
		XCTAssertTrue(parse(&object.optionalDouble, negativeNumber, equal(-50)))
		XCTAssertTrue(object.optionalDouble==negativeNumber.doubleValue)
		
		XCTAssertTrue(parse(&object.optionalDouble, positiveNumber, !equal(40)))
		XCTAssertTrue(object.optionalDouble==positiveNumber.doubleValue)
		
		// String
		XCTAssertTrue(parse(&object.optionalDouble, positiveDoubleString))
		XCTAssertTrue(object.optionalDouble==positiveDouble)
		
		XCTAssertTrue(parse(&object.optionalDouble, negativeDoubleString))
		XCTAssertTrue(object.optionalDouble==negativeDouble)
		
		XCTAssertFalse(parse(&object.optionalDouble, positiveDoubleString, greaterThan(40)))
		XCTAssertFalse(object.optionalDouble==positiveDouble)
		
		XCTAssertTrue(parse(&object.optionalDouble, positiveDoubleString, smallerThanOrEqual(33)))
		XCTAssertTrue(object.optionalDouble==positiveDouble)
		
		XCTAssertFalse(parse(&object.optionalDouble, negativeDoubleString, equal(4)))
		XCTAssertFalse(object.optionalDouble==negativeDouble)
		
		XCTAssertTrue(parse(&object.optionalDouble, negativeDoubleString, equal(-45)))
		XCTAssertTrue(object.optionalDouble==negativeDouble)
		
		XCTAssertTrue(parse(&object.optionalDouble, positiveDoubleString, !equal(40)))
		XCTAssertTrue(object.optionalDouble==positiveDouble)
		
		// NSString
		XCTAssertTrue(parse(&object.optionalDouble, positiveDoubleNSString))
		XCTAssertTrue(object.optionalDouble==positiveDouble)
		
		XCTAssertTrue(parse(&object.optionalDouble, negativeDoubleNSString))
		XCTAssertTrue(object.optionalDouble==negativeDouble)
		
		XCTAssertFalse(parse(&object.optionalDouble, positiveDoubleNSString, greaterThan(40)))
		XCTAssertFalse(object.optionalDouble==positiveDouble)
		
		XCTAssertTrue(parse(&object.optionalDouble, positiveDoubleNSString, smallerThanOrEqual(33)))
		XCTAssertTrue(object.optionalDouble==positiveDouble)
		
		XCTAssertFalse(parse(&object.optionalDouble, negativeDoubleNSString, equal(4)))
		XCTAssertFalse(object.optionalDouble==negativeDouble)
		
		XCTAssertTrue(parse(&object.optionalDouble, negativeDoubleNSString, equal(-45)))
		XCTAssertTrue(object.optionalDouble==negativeDouble)
		
		XCTAssertTrue(parse(&object.optionalDouble, positiveDoubleNSString, !equal(40)))
		XCTAssertTrue(object.optionalDouble==positiveDouble)
	}
	
	func testDate() {
		var date = NSDate()
		let dateString = "24:01:2012 11:55:58"
		let dateFormat = "dd:MM:yyyy HH:mm:ss"
		var parsedString = ""

		XCTAssertTrue(parse(&date, dateString,dateFormat))
		XCTAssertTrue(parse(&date, dateString,dateFormat,earlierThan(NSDate.today())))
		XCTAssertTrue(parse(&date, dateString,dateFormat,laterThan(NSDate(timeIntervalSince1970: 0))))

		let gregorian = NSCalendar(calendarIdentifier: NSGregorianCalendar)
		let dateComponents = gregorian?.components(.CalendarUnitDay | .CalendarUnitMonth | .CalendarUnitYear | .CalendarUnitHour | .CalendarUnitMinute | .CalendarUnitSecond, fromDate: date)
		XCTAssertNotNil(dateComponents)
		XCTAssertTrue(dateComponents?.day==24)
		XCTAssertTrue(dateComponents?.month==1)
		XCTAssertTrue(dateComponents?.year==2012)
		XCTAssertTrue(dateComponents?.hour==11)
		XCTAssertTrue(dateComponents?.minute==55)
		XCTAssertTrue(dateComponents?.second==58)
		
		XCTAssertTrue(parse(&date, NSString(string: dateString),dateFormat,laterThan(NSDate(timeIntervalSince1970: 0))))
		
		let nsstringDateComponents = gregorian?.components(.CalendarUnitDay | .CalendarUnitMonth | .CalendarUnitYear | .CalendarUnitHour | .CalendarUnitMinute | .CalendarUnitSecond, fromDate: date)
		XCTAssertNotNil(nsstringDateComponents)
		XCTAssertTrue(nsstringDateComponents?.day==24)
		XCTAssertTrue(nsstringDateComponents?.month==1)
		XCTAssertTrue(nsstringDateComponents?.year==2012)
		XCTAssertTrue(nsstringDateComponents?.hour==11)
		XCTAssertTrue(nsstringDateComponents?.minute==55)
		XCTAssertTrue(nsstringDateComponents?.second==58)
		
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
		let string = "antonio"
		let rawName: AnyObject = string
		let optionalRawName : AnyObject? = rawName
		var name = ""
		var optionalName: String?
		var nsname = NSString()
		var optionalNSName : NSString?
		
		XCTAssertTrue(parse(&name, rawName))
		XCTAssertTrue(name==string)
		XCTAssertTrue(parse(&name, optionalRawName))
		XCTAssertTrue(name==string)

		XCTAssertTrue(parse(&optionalName, rawName))
		XCTAssertTrue(optionalName==string)
		XCTAssertTrue(parse(&optionalName, optionalRawName))
		XCTAssertTrue(optionalName==string)
		
		XCTAssertTrue(parse(&nsname, rawName))
		XCTAssertTrue(nsname==string)
		XCTAssertTrue(parse(&nsname, optionalRawName))
		XCTAssertTrue(nsname==string)

		XCTAssertTrue(parse(&optionalNSName, rawName))
		XCTAssertTrue(optionalNSName==string)
		XCTAssertTrue(parse(&optionalNSName, optionalRawName))
		XCTAssertTrue(optionalNSName==string)
	}
	
	func testAnyObjectUrl() {
		let string = "http://www.google.com"
		let urlString : AnyObject = string
		let optionalUrlString : AnyObject? = string
		let urlNSString : AnyObject = NSString(string: string)
		let optionalUrlNSString : AnyObject? = NSString(string: string)

		XCTAssertTrue(parse(&object.requiredUrl,urlString))
		XCTAssertTrue(object.requiredUrl.absoluteString==string)
		
		XCTAssertTrue(parse(&object.optionalUrl,urlString))
		XCTAssertTrue(object.optionalUrl?.absoluteString!==string)

		XCTAssertTrue(parse(&object.requiredUrl,optionalUrlString))
		XCTAssertTrue(object.requiredUrl.absoluteString==string)
		
		XCTAssertTrue(parse(&object.optionalUrl,optionalUrlString))
		XCTAssertTrue(object.optionalUrl?.absoluteString!==string)
		
		XCTAssertTrue(parse(&object.requiredUrl,urlNSString))
		XCTAssertTrue(object.requiredUrl.absoluteString==string)
		
		XCTAssertTrue(parse(&object.optionalUrl,urlNSString))
		XCTAssertTrue(object.optionalUrl?.absoluteString!==string)

		XCTAssertTrue(parse(&object.requiredUrl,optionalUrlNSString))
		XCTAssertTrue(object.requiredUrl.absoluteString==string)
		
		XCTAssertTrue(parse(&object.optionalUrl,optionalUrlNSString))
		XCTAssertTrue(object.optionalUrl?.absoluteString!==string)
	}
	
	func testAnyObjectDate() {
		var date = NSDate()
		let dateString: AnyObject? = "24:01:2012 11:55:58"
		let dateFormat = "dd:MM:yyyy HH:mm:ss"
		var parsedString = ""

		XCTAssertTrue(parse(&date, dateString,dateFormat))
		XCTAssertTrue(parse(&date, dateString,dateFormat,earlierThan(NSDate.today())))
	}
	
	func testRequiredIntAnyObject() {
		let positiveInt: AnyObject = 33
		let negativeInt: AnyObject = -45
		let optionalPositiveInt : AnyObject? = 33
		let optionalNegativeInt : AnyObject? = -45
		let positiveNumber : AnyObject = NSNumber(int: 10)
		let negativeNumber : AnyObject = NSNumber(int: -50)
		let positiveIntString : AnyObject = "33"
		let negativeIntString : AnyObject = "-45"
		let positiveIntNSString : AnyObject = NSString(string:"33")
		let negativeIntNSString : AnyObject = NSString(string:"-45")
	
		// Int
	
		XCTAssertTrue(parse(&object.requiredInt, positiveInt))
		XCTAssertTrue(object.requiredInt==33)
	
		XCTAssertTrue(parse(&object.requiredInt, negativeInt))
		XCTAssertTrue(object.requiredInt==(-45))
	
		XCTAssertFalse(parse(&object.requiredInt, positiveInt, greaterThan(40)))
		XCTAssertFalse(object.requiredInt==33)
	
		XCTAssertTrue(parse(&object.requiredInt, positiveInt, smallerThanOrEqual(33)))
		XCTAssertTrue(object.requiredInt==33)
	
		XCTAssertFalse(parse(&object.requiredInt, negativeInt, equal(4)))
		XCTAssertFalse(object.requiredInt==(-45))
	
		XCTAssertTrue(parse(&object.requiredInt, negativeInt, equal(-45)))
		XCTAssertTrue(object.requiredInt==(-45))
	
		XCTAssertTrue(parse(&object.requiredInt, positiveInt, !equal(40)))
		XCTAssertTrue(object.requiredInt==33)
	
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
		XCTAssertTrue(object.requiredInt==33)
	
		XCTAssertTrue(parse(&object.requiredInt, negativeIntString))
		XCTAssertTrue(object.requiredInt==(-45))
	
		XCTAssertFalse(parse(&object.requiredInt, positiveIntString, greaterThan(40)))
		XCTAssertFalse(object.requiredInt==33)
	
		XCTAssertTrue(parse(&object.requiredInt, positiveIntString, smallerThanOrEqual(33)))
		XCTAssertTrue(object.requiredInt==33)
	
		XCTAssertFalse(parse(&object.requiredInt, negativeIntString, equal(4)))
		XCTAssertFalse(object.requiredInt==(-45))
	
		XCTAssertTrue(parse(&object.requiredInt, negativeIntString, equal(-45)))
		XCTAssertTrue(object.requiredInt==(-45))
	
		XCTAssertTrue(parse(&object.requiredInt, positiveIntString, !equal(40)))
		XCTAssertTrue(object.requiredInt==33)
	
		// NSString
		XCTAssertTrue(parse(&object.requiredInt, positiveIntNSString))
		XCTAssertTrue(object.requiredInt==33)
	
		XCTAssertTrue(parse(&object.requiredInt, negativeIntNSString))
		XCTAssertTrue(object.requiredInt==(-45))
	
		XCTAssertFalse(parse(&object.requiredInt, positiveIntNSString, greaterThan(40)))
		XCTAssertFalse(object.requiredInt==33)
	
		XCTAssertTrue(parse(&object.requiredInt, positiveIntNSString, smallerThanOrEqual(33)))
		XCTAssertTrue(object.requiredInt==33)
	
		XCTAssertFalse(parse(&object.requiredInt, negativeIntNSString, equal(4)))
		XCTAssertFalse(object.requiredInt==(-45))
	
		XCTAssertTrue(parse(&object.requiredInt, negativeIntNSString, equal(-45)))
		XCTAssertTrue(object.requiredInt==(-45))
	
		XCTAssertTrue(parse(&object.requiredInt, positiveIntNSString, !equal(40)))
		XCTAssertTrue(object.requiredInt==33)
	}

	func testOptionalIntAnyObject() {
		let positiveInt : AnyObject = 33
		let negativeInt : AnyObject = -45
		let optionalPositiveInt : AnyObject? = 33
		let optionalNegativeInt : AnyObject? = -45
		let positiveNumber : AnyObject = NSNumber(int: 10)
		let negativeNumber : AnyObject = NSNumber(int: -50)
		let positiveIntString : AnyObject = "33"
		let negativeIntString : AnyObject = "-45"
		let positiveIntNSString : AnyObject = NSString(string:"33")
		let negativeIntNSString : AnyObject = NSString(string:"-45")
	
		// Int
	
		XCTAssertTrue(parse(&object.optionalInt, positiveInt))
		XCTAssertTrue(object.optionalInt==33)
	
		XCTAssertTrue(parse(&object.optionalInt, negativeInt))
		XCTAssertTrue(object.optionalInt==(-45))
	
		XCTAssertFalse(parse(&object.optionalInt, positiveInt, greaterThan(40)))
		XCTAssertFalse(object.optionalInt==33)
	
		XCTAssertTrue(parse(&object.optionalInt, positiveInt, smallerThanOrEqual(33)))
		XCTAssertTrue(object.optionalInt==33)
	
		XCTAssertFalse(parse(&object.optionalInt, negativeInt, equal(4)))
		XCTAssertFalse(object.optionalInt==(-45))
	
		XCTAssertTrue(parse(&object.optionalInt, negativeInt, equal(-45)))
		XCTAssertTrue(object.optionalInt==(-45))
	
		XCTAssertTrue(parse(&object.optionalInt, positiveInt, !equal(40)))
		XCTAssertTrue(object.optionalInt==33)
	
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
		XCTAssertTrue(object.optionalInt==33)
	
		XCTAssertTrue(parse(&object.optionalInt, negativeIntString))
		XCTAssertTrue(object.optionalInt==(-45))
	
		XCTAssertFalse(parse(&object.optionalInt, positiveIntString, greaterThan(40)))
		XCTAssertFalse(object.optionalInt==33)
	
		XCTAssertTrue(parse(&object.optionalInt, positiveIntString, smallerThanOrEqual(33)))
		XCTAssertTrue(object.optionalInt==33)
	
		XCTAssertFalse(parse(&object.optionalInt, negativeIntString, equal(4)))
		XCTAssertFalse(object.optionalInt==(-45))
	
		XCTAssertTrue(parse(&object.optionalInt, negativeIntString, equal(-45)))
		XCTAssertTrue(object.optionalInt==(-45))
	
		XCTAssertTrue(parse(&object.optionalInt, positiveIntString, !equal(40)))
		XCTAssertTrue(object.optionalInt==33)
	
		// NSString
		XCTAssertTrue(parse(&object.optionalInt, positiveIntNSString))
		XCTAssertTrue(object.optionalInt==33)
	
		XCTAssertTrue(parse(&object.optionalInt, negativeIntNSString))
		XCTAssertTrue(object.optionalInt==(-45))
	
		XCTAssertFalse(parse(&object.optionalInt, positiveIntNSString, greaterThan(40)))
		XCTAssertFalse(object.optionalInt==33)
	
		XCTAssertTrue(parse(&object.optionalInt, positiveIntNSString, smallerThanOrEqual(33)))
		XCTAssertTrue(object.optionalInt==33)
	
		XCTAssertFalse(parse(&object.optionalInt, negativeIntNSString, equal(4)))
		XCTAssertFalse(object.optionalInt==(-45))
	
		XCTAssertTrue(parse(&object.optionalInt, negativeIntNSString, equal(-45)))
		XCTAssertTrue(object.optionalInt==(-45))
	
		XCTAssertTrue(parse(&object.optionalInt, positiveIntNSString, !equal(40)))
		XCTAssertTrue(object.optionalInt==33)
	}

}


