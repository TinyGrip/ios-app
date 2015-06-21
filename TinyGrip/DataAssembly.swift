//
//  DataAssembly.swift
//  TinyGrip
//
//  Created by Javier Tarazaga on 21/06/15.
//  Copyright © 2015 typhoon. All rights reserved.
//

public class DataAssembly: TyphoonAssembly {
    
    public dynamic func getUserDefaults() -> AnyObject {
        return NSUserDefaults.standardUserDefaults()
    }
    
    public dynamic func sessionData() -> AnyObject {
        return TyphoonDefinition.withClass(SessionDataImpl.self) {
            (definition) in
            
            definition.useInitializer("initWithDefaults:") {
                (initializer) in
                
                initializer.injectParameterWith(self.getUserDefaults())
            }
        }
    }
    
    public dynamic func weatherReportDao() -> AnyObject {
        return TyphoonDefinition.withClass(WeatherReportDaoFileSystemImpl.self)
    }
    
    public dynamic func cityDao() -> AnyObject {
        return TyphoonDefinition.withClass(CityDaoUserDefaultsImpl.self) {
            (definition) in
            
            definition.useInitializer("initWithDefaults:") {
                (initializer) in
                
                initializer.injectParameterWith(self.getUserDefaults())
            }
        }
    }
}
