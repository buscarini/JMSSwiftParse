//
//  testBool.swift
//  JMSSwiftParse
//
//  Created by Jose Manuel Sánchez Peñarroja on 19/11/14.
//  Copyright (c) 2014 José Manuel Sánchez. All rights reserved.
//

import UIKit
import XCTest

import JMSSwiftParse

class testBool: XCTestCase {
	
	let object = TestClass()

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
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
}
