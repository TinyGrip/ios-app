//
//  Root.swift
//  TinyGrip
//
//  Created by Javier Tarazaga on 20/06/15.
//  Copyright © 2015 typhoon. All rights reserved.
//

import Foundation

@objc(PreviewArea)
public class PreviewArea : NSObject, NSCoding {
    
    public private(set) var name : String
    public private(set) var rating : Double
    public private(set) var location : Location
    public private(set) var mySelf : Link
    
    init(name: String, rating: Double, location: Location, mySelf: Link) {
        self.name = name
        self.rating = rating
        self.location = location
        self.mySelf = mySelf
    }
    
    public required init?(coder : NSCoder) {
        self.name = coder.decodeObjectForKey("Name") as! String
        self.rating = coder.decodeObjectForKey("Rating") as! Double
        self.location = coder.decodeObjectForKey("Location") as! Location
        self.mySelf = coder.decodeObjectForKey("MySelf") as! Link
    }
    
    public func encodeWithCoder(coder : NSCoder) {
        coder.encodeObject(self.name, forKey:"Name")
        coder.encodeObject(self.rating, forKey:"Rating")
        coder.encodeObject(self.location, forKey:"Location")
        coder.encodeObject(self.mySelf, forKey:"MySelf")
        
    }
}