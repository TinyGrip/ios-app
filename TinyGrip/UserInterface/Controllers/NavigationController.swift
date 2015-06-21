//
//  NavigationController.swift
//  TinyGrip
//
//  Created by Javier Tarazaga on 21/06/15.
//  Copyright © 2015 typhoon. All rights reserved.
//

import Foundation

public class NavigationController: UITabBarController, UITabBarControllerDelegate {
    
    public private(set) var profileViewController : UIViewController
    public private(set) var discoveryViewController : UIViewController
    public private(set) var homeViewController : UIViewController
    public private(set) var offlineViewController : UIViewController
    public private(set) var settingsViewController : UIViewController
    public private(set) var assembly : ApplicationAssembly
    
    //-------------------------------------------------------------------------------------------
    // MARK: - Initialization & Destruction
    //-------------------------------------------------------------------------------------------
    
    public init(profileViewController : UIViewController,
        discoveryViewController : UIViewController,
        homeViewController : UIViewController,
        offlineViewController : UIViewController,
        settingsViewController : UIViewController,
        assembly : ApplicationAssembly) {
            
            self.profileViewController = profileViewController
            self.discoveryViewController = discoveryViewController
            self.homeViewController = homeViewController
            self.offlineViewController = offlineViewController
            self.settingsViewController = settingsViewController
            self.assembly = assembly
            
            super.init(nibName : nil, bundle : nil)
            
    }
    
    public required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //-------------------------------------------------------------------------------------------
    // MARK: - UITabBarControllerDelegate
    //-------------------------------------------------------------------------------------------
    public func tabBarController(tabBarController: UITabBarController, shouldSelectViewController viewController: UIViewController) -> Bool {
        print("should select viewController: \(viewController.title) ?")
        return true;
    }
    
    //-------------------------------------------------------------------------------------------
    // MARK: - Overridden Methods
    //-------------------------------------------------------------------------------------------
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
    }
    
    public override func viewWillAppear(animated: Bool) {
        initNavigationTabs()
    }
    
    //-------------------------------------------------------------------------------------------
    // MARK: - Private Methods
    //-------------------------------------------------------------------------------------------
    private dynamic func initNavigationTabs() {
//        let iconProfile = UITabBarItem(title: "Profile", image:UIImage(named: "icon_cloudy.png"), selectedImage: UIImage(named: "icon_cloudy.png"))
//        let iconDiscover = UITabBarItem(title: "Discover", image:UIImage(named: "icon_cloudy.png"), selectedImage: UIImage(named: "icon_cloudy.png"))
//        let iconHome = UITabBarItem(title: "Home", image:UIImage(named: "icon_cloudy.png"), selectedImage: UIImage(named: "icon_cloudy.png"))
//        let iconOffline = UITabBarItem(title: "Offline", image:UIImage(named: "icon_cloudy.png"), selectedImage: UIImage(named: "icon_cloudy.png"))
//        let iconSettings = UITabBarItem(title: "Settings", image:UIImage(named: "icon_cloudy.png"), selectedImage: UIImage(named: "icon_cloudy.png"))
        
        let iconProfile = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.Featured, tag:0)
        let iconDiscover = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.Downloads, tag:1)
        let iconHome = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.TopRated, tag:2)
        let iconOffline = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.MostViewed, tag:3)
        let iconSettings = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.Bookmarks, tag:4)
        
        self.profileViewController.tabBarItem = iconProfile
        self.discoveryViewController.tabBarItem = iconDiscover
        self.homeViewController.tabBarItem = iconHome
        self.offlineViewController.tabBarItem = iconOffline
        self.settingsViewController.tabBarItem = iconSettings
        
        //array of the root view controllers displayed by the tab bar interface
        let controllers = [self.profileViewController, self.discoveryViewController, self.homeViewController, self.offlineViewController, self.settingsViewController]
        
        self.viewControllers = controllers
        
        self.selectedIndex = 2
        
    }
    
}