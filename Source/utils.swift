//
//  utils.swift
//  JMSSwiftParse
//
//  Created by Jose Manuel Sánchez Peñarroja on 17/11/14.
//  Copyright (c) 2014 José Manuel Sánchez. All rights reserved.
//

import UIKit

//class Cache {
//	let cache = NSCache()
//	let observer: NSObjectProtocol
//	
//	init() {
//		self.observer = NSNotificationCenter.defaultCenter().addObserverForName(UIApplicationDidReceiveMemoryWarningNotification, object: nil, queue: nil) {
//			(note) in
//			self.cache.removeAllObjects()
//		}
//	}
//	
//	deinit {
//		NSNotificationCenter.defaultCenter().removeObserver(self.observer)
//	}
//}

let gregorian = NSCalendar(calendarIdentifier: NSGregorianCalendar)

// MARK: Dates

extension NSDate {
	class func now() -> NSDate {
		return NSDate()
	}
	
	class func today() -> NSDate {
		let now = self.now()
		if let dateComponents = gregorian?.components(.CalendarUnitDay | .CalendarUnitMonth | .CalendarUnitYear, fromDate: now) {
			if let date = gregorian?.dateFromComponents(dateComponents) {
				return date
			}
		}
		return now
	}
	
	class func tomorrow() -> NSDate {
		var removeDayComponents = NSDateComponents()
		removeDayComponents.day = 1
		if let date = gregorian?.dateByAddingComponents(removeDayComponents, toDate: self.today(), options: .MatchStrictly) {
			return date
		}
		return self.now()
	}
	
	class func yesterday() -> NSDate {
		var removeDayComponents = NSDateComponents()
		removeDayComponents.day = -1
		if let date = gregorian?.dateByAddingComponents(removeDayComponents, toDate: self.today(), options: .MatchStrictly) {
			return date
		}
		return self.now()
	}
	
	class func nextWeek() -> NSDate {
		var removeDayComponents = NSDateComponents()
		removeDayComponents.weekOfYear = 1
		if let date = gregorian?.dateByAddingComponents(removeDayComponents, toDate: self.today(), options: .MatchStrictly) {
			return date
		}
		return self.now()
	}
	
	class func pastWeek() -> NSDate {
		var removeDayComponents = NSDateComponents()
		removeDayComponents.weekOfYear = -1
		if let date = gregorian?.dateByAddingComponents(removeDayComponents, toDate: self.today(), options: .MatchStrictly) {
			return date
		}
		return self.now()
	}
}
