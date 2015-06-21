//
//  MapPoint.swift
//  TinyGrip
//
//  Created by Javier Tarazaga on 21/06/15.
//  Copyright © 2015 typhoon. All rights reserved.
//
import MapKit

class AreaMapAnnotation: NSObject, MKAnnotation {
    let title: String?
    let locationName: String
    let discipline: String
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, locationName: String, discipline: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String? {
        return locationName
    }
}
