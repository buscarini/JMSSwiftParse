//
//  testString.swift
//  JMSSwiftParse
//
//  Created by Jose Manuel Sánchez Peñarroja on 19/11/14.
//  Copyright (c) 2014 José Manuel Sánchez. All rights reserved.
//

import UIKit
import XCTest

import JMSSwiftParse

class testString: XCTestCase {

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

}
