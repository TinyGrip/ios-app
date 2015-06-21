//
//  Root.swift
//  TinyGrip
//
//  Created by Javier Tarazaga on 20/06/15.
//  Copyright © 2015 typhoon. All rights reserved.
//

import Foundation

@objc(PreviewAreas)
public class PreviewAreas : NSObject, NSCoding {
    
    public private(set) var totalAmount : Int
    public private(set) var items : [PreviewArea]
//    public private(set) var next : Link
//    public private(set) var prev : Link
    
    init(totalAmount: Int, items: [PreviewArea]) {
        self.totalAmount = totalAmount
        self.items = items
    }
    
    public required init?(coder : NSCoder) {
        self.totalAmount = coder.decodeObjectForKey("TotalAmount") as! Int
        self.items = coder.decodeObjectForKey("Items") as! [PreviewArea]
//        self.next = coder.decodeObjectForKey("Next") as! Link
//        self.prev = coder.decodeObjectForKey("Prev") as! Link
    }
    
    public func encodeWithCoder(coder : NSCoder) {
        coder.encodeObject(self.totalAmount, forKey:"TotalAmount")
        coder.encodeObject(self.items, forKey:"Items")
//        coder.encodeObject(self.next, forKey:"Next")
//        coder.encodeObject(self.prev, forKey:"Prev")
    }
}