//
//  testNSDate.swift
//  JMSSwiftParse
//
//  Created by Jose Manuel Sánchez Peñarroja on 19/11/14.
//  Copyright (c) 2014 José Manuel Sánchez. All rights reserved.
//

import UIKit
import XCTest

import JMSSwiftParse

class testNSDate: XCTestCase {
	
	let object = TestClass()

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
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
}
