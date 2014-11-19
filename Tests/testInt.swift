//
//  testInt.swift
//  JMSSwiftParse
//
//  Created by Jose Manuel Sánchez Peñarroja on 19/11/14.
//  Copyright (c) 2014 José Manuel Sánchez. All rights reserved.
//

import UIKit
import XCTest
import JMSSwiftParse

class testInt: XCTestCase {
	
	let object = TestClass()
	
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
	
	let badIntString = "Blah"
	let badIntNSString = NSString(string:"Blah")

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
	
	func testRequiredInt() {
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
		
		// Bad int string
		XCTAssertFalse(parse(&object.requiredInt, badIntString))
		XCTAssertTrue(object.requiredInt==positiveInt)

		// Bad int nsstring
		XCTAssertFalse(parse(&object.requiredInt, badIntNSString))
		XCTAssertTrue(object.requiredInt==positiveInt)
	}
	
	func testOptionalInt() {
		
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
		
		// Bad int string
		XCTAssertFalse(parse(&object.optionalInt, badIntString))
		XCTAssertTrue(object.optionalInt==positiveInt)
		
		// Bad int nsstring
		XCTAssertFalse(parse(&object.optionalInt, badIntNSString))
		XCTAssertTrue(object.optionalInt==positiveInt)
	}

}
