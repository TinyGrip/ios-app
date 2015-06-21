//
//  RootClient.swift
//  TinyGrip
//
//  Created by Javier Tarazaga on 20/06/15.
//  Copyright © 2015 typhoon. All rights reserved.
//

import Foundation

/*
* Root client protocol. (Currently, injected protocols require the @objc annotation).
*/
@objc public protocol RootClient {
    
    func loadRoot(onSuccess successBlock: ((Root!) -> Void)!, onError errorBlock: ((String!) -> Void)!)
    func loadPreviewAreas(onSuccess successBlock: ((PreviewAreas!) -> Void)!, onError errorBlock: ((String!) -> Void)!)
    
}
