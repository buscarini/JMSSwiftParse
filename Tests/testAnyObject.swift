//
//  testAnyObject.swift
//  JMSSwiftParse
//
//  Created by Jose Manuel Sánchez Peñarroja on 19/11/14.
//  Copyright (c) 2014 José Manuel Sánchez. All rights reserved.
//

import UIKit
import XCTest

import JMSSwiftParse

class testAnyObject: XCTestCase {
	
	let object = TestClass()

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
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
