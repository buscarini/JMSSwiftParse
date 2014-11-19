//
//  testNSURL.swift
//  JMSSwiftParse
//
//  Created by Jose Manuel Sánchez Peñarroja on 19/11/14.
//  Copyright (c) 2014 José Manuel Sánchez. All rights reserved.
//

import UIKit
import XCTest

import JMSSwiftParse

class testNSURL: XCTestCase {
	
	let object = TestClass()

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
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
}
