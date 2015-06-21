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

/*
* SessionData DAO (persistence) protocol.
* (Currently, injected protocols require the @objc annotation).
*/
@objc public protocol SessionData {

    /**
    * Save the current Root response from the backend to be later be accesses in order to fetch the rest of endpoints defined in the root 
    * object
    */
    func saveRoot(root: Root!)
    
    /**
    * Get the previously saved root elemement fetched from the backend
    */
    func getRoot() -> Root?
}