//
//  HomeViewController.swift
//  TinyGrip
//
//  Created by Javier Tarazaga on 20/06/15.
//  Copyright © 2015 typhoon. All rights reserved.
//

import UIKit
import QuartzCore


class HomeViewController: UIViewController {
    
    var homeView : HomeView;

    private(set) var mapViewController : MapViewController
    private(set) var rootClient : RootClient
    private(set) var sessionData : SessionData
    private(set) var assembly : ApplicationAssembly

    
    //-------------------------------------------------------------------------------------------
    // MARK: - Initialization & Destruction
    //-------------------------------------------------------------------------------------------
    
    dynamic init(view: HomeView, mapViewController : MapViewController, rootClient : RootClient, sessionData : SessionData, assembly : ApplicationAssembly) {
        
        self.homeView = view
        self.mapViewController = mapViewController
        self.rootClient = rootClient
        self.sessionData = sessionData
        self.assembly = assembly
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //-------------------------------------------------------------------------------------------
    // MARK: - Overridden Methods
    //-------------------------------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.homeView.frame = CGRectMake(0, 30, self.view.frame.size.width - 40, 40)
        self.homeView.centerHorizontallyInSuperView()
        self.homeView.backgroundColor = UIColor.grayColor()
        self.mapViewController.view.frame = self.view.frame
        
        self.addChildViewController(mapViewController)
        
        self.view.addSubview(mapViewController.mapView)
        self.view.addSubview(homeView)
        
        mapViewController.didMoveToParentViewController(self)
        
        self.refreshData()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController!.navigationBarHidden = true
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    
    //-------------------------------------------------------------------------------------------
    // MARK: - Private Methods
    //-------------------------------------------------------------------------------------------
    private dynamic func refreshData() {
        ICLoader.present()
        
        self.rootClient.loadPreviewAreas(onSuccess: {
            (previewAreas) in
            
            self.mapViewController.displayPreviewAreas(previewAreas)
            ICLoader.dismiss()
            }, onError: {
                (message) in
                
                ICLoader.dismiss()
                print ("Error" + message)
        })
    }
    
//    private dynamic func presentMenu() {
//        let rootViewController = self.assembly.rootViewController() as! RootViewController
//        rootViewController.toggleSideViewController()
//    }
}


