//
//  helpers.swift
//  JMSSwiftParse
//
//  Created by Jose Manuel Sánchez Peñarroja on 19/11/14.
//  Copyright (c) 2014 José Manuel Sánchez. All rights reserved.
//

import Foundation

public class TestClass {
	var requiredString = ""
	var optionalString : String?
	var email = ""
	var requiredUrl : NSURL = NSURL(string : "blah")!
	var optionalUrl : NSURL? = NSURL()
	var requiredBool = false
	var optionalBool : Bool?
	var availableString = ""
	var requiredInt = 0
	var optionalInt : Int? = 0
	var requiredDouble = 0.0
	var optionalDouble : Double? = 0.0
	
	var date = NSDate()
	
	public init() {
		
	}
}

