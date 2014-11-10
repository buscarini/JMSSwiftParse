//
//  JMSParseTests.swift
//  JMSParseTests
//
//  Created by Jose Manuel Sánchez Peñarroja on 10/11/14.
//  Copyright (c) 2014 José Manuel Sánchez. All rights reserved.
//

import UIKit
import XCTest
import JMSParse

class TestClass {
	var name = ""
	var email = ""
	var url = NSURL()
	var available = false
	var amount = 0
	var date = NSDate()
}

class JMSParseTests: XCTestCase {
	
	let object = TestClass()
	
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
	func testString() {
		let name = "Pepe"
		let other = "blah"
		
		XCTAssertTrue(parse(&object.name,name))
		XCTAssertTrue(object.name==name)
		
		object.name = other
		
		XCTAssertTrue(parse(&object.name,name,longerThan(3) && shorterThan(5)))
		XCTAssertTrue(object.name==name)
		
		object.name = other
		
		XCTAssertFalse(parse(&object.name,name,longerThan(5)))
		XCTAssertTrue(object.name!=name)
		
		XCTAssertTrue(parse(&object.name,name,!longerThan(5)))
		XCTAssertTrue(object.name==name)
		
		object.name = other
		
		XCTAssertTrue(parse(&object.name,name,longerThan(5) || shorterThan(5)))
		XCTAssertTrue(object.name==name)
	}
	
	func testNSString() {
		let name : NSString = NSString("Antonio")
		let other = "blah"
		
		XCTAssertTrue(parse(&object.name,name))
		XCTAssertTrue(object.name==name)
		
		object.name = other
		
		XCTAssertTrue(parse(&object.name,name,longerThan(3) && shorterThan(5)))
		XCTAssertTrue(object.name==name)
		
		object.name = other
		
		XCTAssertFalse(parse(&object.name,name,longerThan(5)))
		XCTAssertTrue(object.name!=name)
		
		XCTAssertTrue(parse(&object.name,name,!longerThan(5)))
		XCTAssertTrue(object.name==name)
		
		object.name = other
		
		XCTAssertTrue(parse(&object.name,name,longerThan(5) || shorterThan(5)))
		XCTAssertTrue(object.name==name)
	}
	
	func testEmail() {
		let validEmail = "pepe@blah.com"
		let invalidEmail = "other"
		
		XCTAssertTrue(parse(&object.email,validEmail, isEmail))
		XCTAssertTrue(object.email==email)
		
		XCTAssertFalse(parse(&object.email,invalidEmail, isEmail))
		XCTAssertFalse(object.email==invalidEmail)
	}
	
	func testUrl() {
		let validUrlString = "http://www.google.com"
		let invalidUrlString = "blah"
		
		XCTAssertTrue(parse(&object.url,validUrlString))
		XCTAssertTrue(object.url==validUrlString)
		
		XCTAssertFalse(parse(&object.url,invalidUrlString))
		XCTAssertFalse(object.url==invalidUrlString)
	}
	
	func testBool() {
		let trueBool = true
		let falseBool = false
		let trueNumber = NSNumber(bool: true))
		let falseNumber = NSNumber(bool: false))
		let trueString = "true"
		let falseString = "false"
		let trueString2 = "TRUE"
		let falseString2 = "FALSE"
		
		XCTAssertTrue(parse(&object.available,trueBool))
		XCTAssertTrue(object.available)
		XCTAssertTrue(parse(&object.available,falseBool))
		XCTAssertFalse(object.available)
		
		XCTAssertTrue(parse(&object.available,trueNumber))
		XCTAssertTrue(object.available)
		XCTAssertTrue(parse(&object.available,falseNumber))
		XCTAssertFalse(object.available)
		
		XCTAssertTrue(parse(&object.available,trueString))
		XCTAssertTrue(object.available)
		XCTAssertTrue(parse(&object.available,falseString))
		XCTAssertFalse(object.available)
		
		XCTAssertTrue(parse(&object.available,trueString2))
		XCTAssertTrue(object.available)
		XCTAssertTrue(parse(&object.available,falseString2))
		XCTAssertFalse(object.available)
	}
	
	func testInt() {
		let positiveInt = 33
		let negativeInt = -45
		let positiveNumber = NSNumber(10)
		let negativeNumber = NSNumber(-50)
		
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
		XCTAssertTrue(object.amount==positiveNumber.intValue)
		
		XCTAssertTrue(parse(&object.amount, negativeNumber))
		XCTAssertTrue(object.amount==negativeNumber.intValue)
		
		XCTAssertFalse(parse(&object.amount, positiveNumber, greaterThan(40)))
		XCTAssertFalse(object.amount==positiveNumber.intValue)
		
		XCTAssertTrue(parse(&object.amount, positiveNumber, smallerThanOrEqual(33)))
		XCTAssertTrue(object.amount==positiveNumber.intValue)
		
		XCTAssertFalse(parse(&object.amount, negativeNumber, equal(4)))
		XCTAssertFalse(object.amount==negativeNumber.intValue)
		
		XCTAssertTrue(parse(&object.amount, negativeNumber, equal(-45)))
		XCTAssertTrue(object.amount==negativeNumber.intValue)
		
		XCTAssertTrue(parse(&object.amount, positiveNumber, !equal(40)))
		XCTAssertTrue(object.amount==positiveNumber.intValue)
	}
    
}
