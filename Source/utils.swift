//
//  utils.swift
//  JMSSwiftParse
//
//  Created by Jose Manuel Sánchez Peñarroja on 17/11/14.
//  Copyright (c) 2014 José Manuel Sánchez. All rights reserved.
//

import UIKit

public class Cache {
	let cache = NSCache()
	var observer: NSObjectProtocol?
	
	init() {
		self.observer = NSNotificationCenter.defaultCenter().addObserverForName(UIApplicationDidReceiveMemoryWarningNotification, object: nil, queue: nil,{
			(note) in
			self.cache.removeAllObjects()
		})
	}
	
	deinit {
		if let observer = self.observer {
			NSNotificationCenter.defaultCenter().removeObserver(observer)
		}
	}
	
	func objectForKey(key: String) -> NSDateFormatter? {
		return self.cache.objectForKey(key) as? NSDateFormatter
	}
	
	func setObject(object: NSDateFormatter,forKey: String) {
		self.cache.setObject(object, forKey: forKey)
	}
}

let gregorian = NSCalendar(calendarIdentifier: NSGregorianCalendar)

// MARK: Dates

public extension NSDate {
	public class func now() -> NSDate {
		return NSDate()
	}
	
	public class func today() -> NSDate {
		let now = self.now()
		if let dateComponents = gregorian?.components(.CalendarUnitDay | .CalendarUnitMonth | .CalendarUnitYear, fromDate: now) {
			if let date = gregorian?.dateFromComponents(dateComponents) {
				return date
			}
		}
		return now
	}
	
	public class func tomorrow() -> NSDate {
		var removeDayComponents = NSDateComponents()
		removeDayComponents.day = 1
		if let date = gregorian?.dateByAddingComponents(removeDayComponents, toDate: self.today(), options: .MatchStrictly) {
			return date
		}
		return self.now()
	}
	
	public class func yesterday() -> NSDate {
		var removeDayComponents = NSDateComponents()
		removeDayComponents.day = -1
		if let date = gregorian?.dateByAddingComponents(removeDayComponents, toDate: self.today(), options: .MatchStrictly) {
			return date
		}
		return self.now()
	}
	
	public class func nextWeek() -> NSDate {
		var removeDayComponents = NSDateComponents()
		removeDayComponents.weekOfYear = 1
		if let date = gregorian?.dateByAddingComponents(removeDayComponents, toDate: self.today(), options: .MatchStrictly) {
			return date
		}
		return self.now()
	}
	
	public class func pastWeek() -> NSDate {
		var removeDayComponents = NSDateComponents()
		removeDayComponents.weekOfYear = -1
		if let date = gregorian?.dateByAddingComponents(removeDayComponents, toDate: self.today(), options: .MatchStrictly) {
			return date
		}
		return self.now()
	}
}

// MARK: Optional

extension Optional {
	func valueOrDefault(defaultValue: @autoclosure ()->T) -> T {
		return apply(self!, defaultValue())
	}
	
	var hasValue: Bool {
		get { return apply(true, false) }
	}
	
	private func apply<U>(caseSome:@autoclosure ()->U,_ caseNone:@autoclosure ()->U) -> U {
		switch(self) {
		case .Some:
			return caseSome()
		case .None:
			return caseNone()
		}
	}
}

