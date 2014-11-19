//
//  testEmail.swift
//  JMSSwiftParse
//
//  Created by Jose Manuel Sánchez Peñarroja on 19/11/14.
//  Copyright (c) 2014 José Manuel Sánchez. All rights reserved.
//

import UIKit
import XCTest

import JMSSwiftParse

class testEmail: XCTestCase {
	
	let object = TestClass()

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
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
	
}
