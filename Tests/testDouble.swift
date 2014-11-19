//
//  testDouble.swift
//  JMSSwiftParse
//
//  Created by Jose Manuel Sánchez Peñarroja on 19/11/14.
//  Copyright (c) 2014 José Manuel Sánchez. All rights reserved.
//

import UIKit
import XCTest

import JMSSwiftParse

class testDouble: XCTestCase {
	
	let object = TestClass()
	
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

	let badDoubleString = "Blah"
	let badDoubleNSString = NSString(string: "Blah")

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

	func testRequiredDouble() {
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

		
		// Bad String
		XCTAssertFalse(parse(&object.requiredDouble, badDoubleString))
		XCTAssertTrue(object.requiredDouble==positiveDouble)

		// Bad NSString
		XCTAssertFalse(parse(&object.requiredDouble, badDoubleNSString))
		XCTAssertTrue(object.requiredDouble==positiveDouble)
	}
	
	func testOptionalDouble() {
		
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
		
		// Bad String
		XCTAssertFalse(parse(&object.optionalDouble, badDoubleString))
		XCTAssertTrue(object.optionalDouble==positiveDouble)
		
		// Bad NSString
		XCTAssertFalse(parse(&object.optionalDouble, badDoubleNSString))
		XCTAssertTrue(object.optionalDouble==positiveDouble)
	}
}
