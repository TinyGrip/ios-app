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

extension NSDictionary {
    
    public func parseError() -> NSError? {
        
        if let errors = self.valueForKeyPath("data.error") as? NSArray {
            if let errorDict = errors[0] as? NSDictionary {
                if let message = errorDict["msg"] as? String {
                    return NSError(message: message)
                }
            }
        }
        return nil;
    }
    
    public func toRoot() -> Root {
        let previewAreas = (self.valueForKeyPath("PreviewAreas")! as! NSDictionary).toLink()
        
        return Root(previewAreas: previewAreas)
    }
    
    public func toPreviewAreas() -> PreviewAreas {
        let totalAmount = self.valueForKeyPath("TotalAmount")! as! Int
        var previewAreas : Array<PreviewArea> = []
        for item in self.valueForKeyPath("Items") as! NSArray {
            previewAreas.append(item.toPreviewArea())
        }
        
//        let next = (self.valueForKeyPath("Next")) as? [Link]
//        let prev = (self.valueForKeyPath("Prev")) as? [Link]
        
        return PreviewAreas(totalAmount: totalAmount, items: previewAreas)
    }
    
    public func toLink() -> Link {
        let href = NSURL(string: self.valueForKey("Href")! as! String)
        let templated = self.valueForKey("Templated")! as! Bool
        
        return Link(href: href!, templated: templated)
    }
    
    public func toPreviewArea() -> PreviewArea {
        let name = self.valueForKey("Name")! as! String
        let rating = self.valueForKey("Rating")! as! Double
        let location = self.valueForKey("Location")!.toLocation()
        let mySelf = self.valueForKey("Self")!.toLink()
        
        return PreviewArea(name: name, rating: rating, location: location, mySelf: mySelf)
    }
    
    public func toLocation() -> Location {
        let latitude = self.valueForKey("Latitude")! as! Double
        let longitude = self.valueForKey("Longitude")! as! Double
        
        return Location(latitude: latitude, longitude: longitude)
    }
    
    
    public func toWeatherReport() -> WeatherReport {
        
        let city = self.valueForKeyPath("data.request.query")![0] as! String
        let currentConditions = (self.valueForKeyPath("data.current_condition")![0] as! NSDictionary).toCurrentConditions()
        var forecastConditions : Array<ForecastConditions> = []
        for item in self.valueForKeyPath("data.weather") as! NSArray {
            forecastConditions.append(item.toForecastConditions())
        }
        return WeatherReport(city: city, date: NSDate(), currentConditions: currentConditions, forecast: forecastConditions)
    }
    
    public func toCurrentConditions() -> CurrentConditions {
        
        let summary = self.valueForKeyPath("weatherDesc")![0]["value"] as! String
        let temperature = Temperature(fahrenheitString: self.valueForKeyPath("temp_F") as! String)
        let humidity = self.valueForKeyPath("humidity") as! String
        let wind = String(format: "Wind: %@ km %@", self.valueForKeyPath("windspeedKmph") as! String,
            self.valueForKeyPath("winddir16Point") as! String)
        let imageUri = self.valueForKeyPath("weatherIconUrl")![0]["value"] as! String
        
        return CurrentConditions(summary: summary, temperature: temperature, humidity: humidity, wind: wind, imageUri: imageUri)
    }
    
    public func toForecastConditions() -> ForecastConditions {
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let date = formatter.dateFromString(self.valueForKeyPath("date") as! String)!
        
        var low: Temperature?
        if self.valueForKeyPath("tempMinF") != nil {
            low = Temperature(fahrenheitString: self.valueForKey("tempMinF") as! String)
        }
        
        var high: Temperature?
        if self.valueForKey("tempMaxF") != nil {
            high = Temperature(fahrenheitString: self.valueForKey("tempMaxF") as! String)
        }
        
        var description = ""
        if self.valueForKeyPath("weatherDesc") != nil {
            description = self.valueForKeyPath("weatherDesc")![0]["value"] as! String
        }
        
        var imageUri = ""
        if self.valueForKeyPath("weatherIconUrl") != nil {
            imageUri = self.valueForKeyPath("weatherIconUrl")![0]["value"] as! String
        }
        
        return ForecastConditions(date: date, low: low, high: high, summary: description, imageUri: imageUri)
    }
    
}

