//
//  Root.swift
//  TinyGrip
//
//  Created by Javier Tarazaga on 20/06/15.
//  Copyright © 2015 typhoon. All rights reserved.
//

import Foundation

@objc(Location)
public class Location : NSObject, NSCoding {
    
    public private(set) var latitude : Double
    public private(set) var longitude : Double
    
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
    
    public required init?(coder : NSCoder) {
        self.latitude = coder.decodeObjectForKey("Latitude") as! Double
        self.longitude = coder.decodeObjectForKey("Longitude") as! Double
    }
    
    public func encodeWithCoder(coder : NSCoder) {
        coder.encodeObject(self.latitude, forKey:"Latitude")
        coder.encodeObject(self.longitude, forKey:"Longitude")
    }
}