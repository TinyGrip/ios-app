//
//  HomeViewController.swift
//  TinyGrip
//
//  Created by Javier Tarazaga on 20/06/15.
//  Copyright © 2015 typhoon. All rights reserved.
//

import UIKit


public class DiscoveryViewController: UIViewController {
    
    public var discoveryView : DiscoveryView {
        get {
            return self.view as! DiscoveryView
        }
        set {
            self.view = newValue
        }
    }
    
    public private(set) var rootClient : RootClient
    public private(set) var sessionData : SessionData
    public private(set) var assembly : ApplicationAssembly
    
    //-------------------------------------------------------------------------------------------
    // MARK: - Initialization & Destruction
    //-------------------------------------------------------------------------------------------
    
    public dynamic init(view: DiscoveryView, rootClient : RootClient, sessionData : SessionData, assembly : ApplicationAssembly) {
        
        self.rootClient = rootClient
        self.sessionData = sessionData
        self.assembly = assembly
        
        super.init(nibName: nil, bundle: nil)
        
        self.discoveryView = view
        
    }
    
    public required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //-------------------------------------------------------------------------------------------
    // MARK: - Overridden Methods
    //-------------------------------------------------------------------------------------------
    
    public override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController!.navigationBarHidden = true
        
        self.refreshData()
    }
    
    public override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    
    public override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    
    //-------------------------------------------------------------------------------------------
    // MARK: - Private Methods
    //-------------------------------------------------------------------------------------------
    
    private dynamic func refreshData() {
    }
}


