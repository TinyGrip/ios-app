//
//  Root.swift
//  TinyGrip
//
//  Created by Javier Tarazaga on 20/06/15.
//  Copyright © 2015 typhoon. All rights reserved.
//

import Foundation

@objc(Root)
public class Root : NSObject, NSCoding {
    
    public private(set) var previewAreas : Link
    
    init(previewAreas: Link) {
        self.previewAreas = previewAreas
    }
    
    public required init?(coder : NSCoder) {
        self.previewAreas = coder.decodeObjectForKey("PreviewAreas") as! Link
    }
    
    public func encodeWithCoder(coder : NSCoder) {
        coder.encodeObject(self.previewAreas, forKey:"PreviewAreas")
    }
}