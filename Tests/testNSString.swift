//
//  testNSString.swift
//  JMSSwiftParse
//
//  Created by Jose Manuel Sánchez Peñarroja on 19/11/14.
//  Copyright (c) 2014 José Manuel Sánchez. All rights reserved.
//

import UIKit
import XCTest

import JMSSwiftParse

class testNSString: XCTestCase {
	
	let object = TestClass()

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
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

}
