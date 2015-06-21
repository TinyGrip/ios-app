////////////////////////////////////////////////////////////////////////////////
//
//  TYPHOON FRAMEWORK
//  Copyright 2013, Typhoon Framework Contributors
//  All Rights Reserved.
//
//  NOTICE: The authors permit you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////

import Foundation

public class SessionDataImpl : NSObject, SessionData {
    
    var defaults : NSUserDefaults
    let rootKey = "pfSessionData.rootKey"
    
    init(defaults : NSUserDefaults) {
        self.defaults = defaults
    }
    
    public func saveRoot(root: Root!) {
        self.defaults.setObject(NSKeyedArchiver.archivedDataWithRootObject(root), forKey: self.rootKey)
    }
    
    public func getRoot() -> Root? {
        var root : Root!
        
        if let data = self.defaults.objectForKey(self.rootKey) as? NSData {
            root = NSKeyedUnarchiver.unarchiveObjectWithData(data) as! Root
        }
        
        return root
    }
}
