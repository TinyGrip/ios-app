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

class RootClientBasicImpl: NSObject, RootClient {
    
    var sessionData: SessionData!
    var serviceUrl: NSURL!
    
    func loadRoot(onSuccess successBlock: ((Root!) -> Void)!, onError errorBlock: ((String!) -> Void)!) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            let url = self.serviceUrl
            let data = NSData(contentsOfURL: url!)
            
            let dictionary = try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
            
            if let error = dictionary.parseError() {
                dispatch_async(dispatch_get_main_queue()) {
                    errorBlock(error.rootCause())
                    return
                }
            } else {
                let root: Root = dictionary.toRoot()
                dispatch_async(dispatch_get_main_queue()) {
                    
                    self.sessionData?.saveRoot(root)
                    successBlock(root)
                    return
                }
            }
        }
    }
    
    func loadPreviewAreas(onSuccess successBlock: ((PreviewAreas!) -> Void)!, onError errorBlock: ((String!) -> Void)!) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            let url = self.sessionData!.getRoot()!.previewAreas.href
            let data = NSData(contentsOfURL: url)
            
            let dictionary = try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
            
            if let error = dictionary.parseError() {
                dispatch_async(dispatch_get_main_queue()) {
                    errorBlock(error.rootCause())
                    return
                }
            } else {
                let previewAreas: PreviewAreas = dictionary.toPreviewAreas()
                dispatch_async(dispatch_get_main_queue()) {
                    successBlock(previewAreas)
                    return
                }
            }
        }
    }
}