//
//  DataAssembly.swift
//  TinyGrip
//
//  Created by Javier Tarazaga on 21/06/15.
//  Copyright © 2015 typhoon. All rights reserved.
//

public class ApiAssembly: TyphoonAssembly {
    
    public var dataAssembly: DataAssembly!
    
    public dynamic func rootClient() -> AnyObject {
        return TyphoonDefinition.withClass(RootClientBasicImpl.self) {
            (definition) in
            
            definition.injectProperty("serviceUrl", with:TyphoonConfig("service.url"))
            definition.injectProperty("sessionData", with:self.dataAssembly.sessionData())
        }
    }
    
    public dynamic func weatherClient() -> AnyObject {
        return TyphoonDefinition.withClass(WeatherClientBasicImpl.self) {
            (definition) in
            
            definition.injectProperty("serviceUrl", with:TyphoonConfig("service.url"))
            definition.injectProperty("apiKey", with:TyphoonConfig("api.key"))
            definition.injectProperty("weatherReportDao", with:self.dataAssembly.weatherReportDao())
            definition.injectProperty("daysToRetrieve", with:TyphoonConfig("days.to.retrieve"))
        }
    }
}
