//
//  Link.swift
//  TinyGrip
//
//  Created by Javier Tarazaga on 20/06/15.
//  Copyright © 2015 typhoon. All rights reserved.
//

import Foundation

public class Link : NSObject, NSCoding {
    
    public private(set) var href : NSURL
    public private(set) var templated : Bool

    public init(href: NSURL, templated: Bool) {
        self.href = href
        self.templated = templated
    }
    
    public required init?(coder : NSCoder) {
        self.href = coder.decodeObjectForKey("Href") as! NSURL
        self.templated = coder.decodeObjectForKey("Templated") as! Bool
    }
    
    public func encodeWithCoder(coder : NSCoder) {
        coder.encodeObject(self.href, forKey:"Href")
        coder.encodeObject(self.templated, forKey:"Templated")
        
    }
}