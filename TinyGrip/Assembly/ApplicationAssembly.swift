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

public class ApplicationAssembly: TyphoonAssembly {
    
    //-------------------------------------------------------------------------------------------
    // MARK: - Bootstrapping
    //-------------------------------------------------------------------------------------------
    
    
    /*
    * These are modules - assemblies collaborate to provie components to this one.  At runtime you
    * can instantiate Typhoon with any assembly tha satisfies the module interface.
    */
    public var dataAssembly: DataAssembly!
    public var apiAssembly: ApiAssembly!
    public var themeAssembly: ThemeAssembly!
    
    /*
    * This is the definition for our AppDelegate. Typhoon will inject the specified properties
    * at application startup.
    */
    public dynamic func appDelegate() -> AnyObject {
        return TyphoonDefinition.withClass(AppDelegate.self) {
            (definition) in
            
            definition.injectProperty("rootClient", with: self.apiAssembly.rootClient())
            definition.injectProperty("rootViewController", with: self.rootViewController())
        }
    }
    
    
    /*
    * A config definition, referencing properties that will be loaded from a plist.
    */
    public dynamic func config() -> AnyObject {
        
        return TyphoonDefinition.configDefinitionWithName("Configuration.plist")
    }
    
    
    //-------------------------------------------------------------------------------------------
    // MARK: - Main Assembly
    //-------------------------------------------------------------------------------------------
    
    public dynamic func rootViewController() -> AnyObject {
        return TyphoonDefinition.withClass(RootViewController.self) {
            (definition) in
            definition.useInitializer("initWithMainContentViewController:assembly:") {
                (initializer) in
                
                initializer.injectParameterWith(self.navigationController())
                initializer.injectParameterWith(self)
            }
            definition.scope = TyphoonScope.Singleton
        }
    }
    
    public dynamic func navigationController() -> AnyObject {
        return TyphoonDefinition.withClass(NavigationController.self) {
            (definition) in
            definition.useInitializer("initWithProfileViewController:discoveryViewController:homeViewController:offlineViewController:settingsViewController:assembly:") {
                (initializer) in
                
                initializer.injectParameterWith(self.profileController())
                initializer.injectParameterWith(self.discoveryController())
                initializer.injectParameterWith(self.homeController())
                initializer.injectParameterWith(self.offlineController())
                initializer.injectParameterWith(self.settingsController())
                initializer.injectParameterWith(self)
            }
        }
    }
    
    public dynamic func profileController() -> AnyObject {
        
        return TyphoonDefinition.withClass(ProfileViewController.self) {
            (definition) in
            
            definition.useInitializer("initWithView:rootClient:sessionData:assembly:") {
                (initializer) in
                
                initializer.injectParameterWith(self.profileView())
                initializer.injectParameterWith(self.apiAssembly.rootClient())
                initializer.injectParameterWith(self.dataAssembly.sessionData())
                initializer.injectParameterWith(self)
                
            }
        };
    }
    
    public dynamic func profileView() -> AnyObject {
        
        return TyphoonDefinition.withClass(ProfileView.self) {
            (definition) in
            
            definition.injectProperty("theme", with: self.themeAssembly.currentTheme())
        }
    }
    
    public dynamic func discoveryController() -> AnyObject {
        
        return TyphoonDefinition.withClass(DiscoveryViewController.self) {
            (definition) in
            
            definition.useInitializer("initWithView:rootClient:sessionData:assembly:") {
                (initializer) in
                
                initializer.injectParameterWith(self.discoverView())
                initializer.injectParameterWith(self.apiAssembly.rootClient())
                initializer.injectParameterWith(self.dataAssembly.sessionData())
                initializer.injectParameterWith(self)
                
            }
        };
    }
    
    public dynamic func discoverView() -> AnyObject {
        
        return TyphoonDefinition.withClass(DiscoveryView.self) {
            (definition) in
            
            definition.injectProperty("theme", with: self.themeAssembly.currentTheme())
        }
    }
    
    public dynamic func homeController() -> AnyObject {
        
        return TyphoonDefinition.withClass(HomeViewController.self) {
            (definition) in
            
            definition.useInitializer("initWithView:mapViewController:rootClient:sessionData:assembly:") {
                (initializer) in
                
                initializer.injectParameterWith(self.homeView())
                initializer.injectParameterWith(self.mapViewController())
                initializer.injectParameterWith(self.apiAssembly.rootClient())
                initializer.injectParameterWith(self.dataAssembly.sessionData())
                initializer.injectParameterWith(self)
                
            }
        };
    }
    
    public dynamic func homeView() -> AnyObject {
        
        return TyphoonDefinition.withClass(HomeView.self) {
            (definition) in
            
            definition.injectProperty("theme", with: self.themeAssembly.currentTheme())
        }
    }
    
    public dynamic func offlineController() -> AnyObject {
        
        return TyphoonDefinition.withClass(OfflineViewController.self) {
            (definition) in
            
            definition.useInitializer("initWithView:rootClient:sessionData:assembly:") {
                (initializer) in
                
                initializer.injectParameterWith(self.offlineView())
                initializer.injectParameterWith(self.apiAssembly.rootClient())
                initializer.injectParameterWith(self.dataAssembly.sessionData())
                initializer.injectParameterWith(self)
                
            }
        };
    }
    
    public dynamic func offlineView() -> AnyObject {
        
        return TyphoonDefinition.withClass(OfflineView.self) {
            (definition) in
            
            definition.injectProperty("theme", with: self.themeAssembly.currentTheme())
        }
    }
    
    public dynamic func settingsController() -> AnyObject {
        
        return TyphoonDefinition.withClass(SettingsViewController.self) {
            (definition) in
            
            definition.useInitializer("initWithView:rootClient:sessionData:assembly:") {
                (initializer) in
                
                initializer.injectParameterWith(self.settingsView())
                initializer.injectParameterWith(self.apiAssembly.rootClient())
                initializer.injectParameterWith(self.dataAssembly.sessionData())
                initializer.injectParameterWith(self)
                
            }
        };
    }
    
    public dynamic func settingsView() -> AnyObject {
        
        return TyphoonDefinition.withClass(SettingsView.self) {
            (definition) in
            
            definition.injectProperty("theme", with: self.themeAssembly.currentTheme())
        }
    }
    
    
    public dynamic func citiesListController() -> AnyObject {
        
        return TyphoonDefinition.withClass(CitiesListViewController.self) {
            (definition) in
            
            definition.useInitializer("initWithCityDao:theme:") {
                (initializer) in
                
                initializer.injectParameterWith(self.dataAssembly.cityDao())
                initializer.injectParameterWith(self.themeAssembly.currentTheme())
            }
            definition.injectProperty("assembly")
        }
        
    }
    
    
    public dynamic func weatherReportController() -> AnyObject {
        
        return TyphoonDefinition.withClass(WeatherReportViewController.self) {
            (definition) in
            
            definition.useInitializer("initWithView:weatherClient:weatherReportDao:cityDao:assembly:") {
                (initializer) in
                
                initializer.injectParameterWith(self.weatherReportView())
                initializer.injectParameterWith(self.apiAssembly.weatherClient())
                initializer.injectParameterWith(self.dataAssembly.weatherReportDao())
                initializer.injectParameterWith(self.dataAssembly.cityDao())
                initializer.injectParameterWith(self)
                
            }
        };
    }
    
    public dynamic func weatherReportView() -> AnyObject {
        
        return TyphoonDefinition.withClass(WeatherReportView.self) {
            (definition) in
            
            definition.injectProperty("theme", with: self.themeAssembly.currentTheme())
        }
    }
    
    public dynamic func addCityViewController() -> AnyObject {
        
        return TyphoonDefinition.withClass(AddCityViewController.self) {
            (definition) in
            
            // TODO: Seems sub-class MUST override this initializer otherwise it can't be
            // TODO: invoked in RELEASE configuration. Bug?
            definition.useInitializer("initWithNibName:bundle:") {
                (initializer) in
                
                initializer.injectParameterWith("AddCity")
                initializer.injectParameterWith(NSBundle.mainBundle())
            }
            
            
            
            definition.injectProperty("cityDao", with: self.dataAssembly.cityDao())
            definition.injectProperty("weatherClient", with: self.apiAssembly.weatherClient())
            definition.injectProperty("theme", with: self.themeAssembly.currentTheme())
            definition.injectProperty("rootViewController", with: self.rootViewController())
        }
    }
    
    public dynamic func mapViewController() -> AnyObject {
        return TyphoonDefinition.withClass(MapViewController.self) {
            (definition) in
            definition.useInitializer("initWithAssembly:") {
                (initializer) in
                
                initializer.injectParameterWith(self)
            }
        }
    }
    
    
}
