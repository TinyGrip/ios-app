//
//  MapViewController.swift
//  TinyGrip
//
//  Created by Javier Tarazaga on 21/06/15.
//  Copyright © 2015 typhoon. All rights reserved.
//

import Foundation
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate {
    
    var mapView : MKMapView {
        get {
            return self.view as! MKMapView
        }
        set {
            self.view = newValue
        }
    }
    // MARK: - location manager to authorize user location for Maps app
    private var locationManager = CLLocationManager()
    private let regionRadius: CLLocationDistance = 1000
    
    // Variable reprensenting if the map has been centered while the view is displayed to the user
    private var mapCentered: Bool = false
    
    //-------------------------------------------------------------------------------------------
    // MARK: - Initialization & Destruction
    //-------------------------------------------------------------------------------------------
    dynamic init(assembly : ApplicationAssembly) {
        super.init(nibName: nil, bundle: nil)
        
        self.initMapView()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //-------------------------------------------------------------------------------------------
    // MARK: - Overridden Methods
    //-------------------------------------------------------------------------------------------
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        checkLocationAuthorizationStatus()
        
        if (CLLocationManager.locationServicesEnabled()) {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [AnyObject]) {
        let location = locations.last as! CLLocation
        
        if (!self.mapCentered) {
            self.mapCentered = true;
            
            let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            self.centerMapOnLocation(center)
        }
    }
    
    override func viewDidDisappear(animated: Bool) {
        self.mapCentered = false;
    }
    
    //-------------------------------------------------------------------------------------------
    // MARK: - Private Methods
    //-------------------------------------------------------------------------------------------
    private func initMapView() {
        self.mapView = MKMapView()
        self.mapView.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        
//        // show artwork on map
//        let placeMapAnnotation = AreaMapAnnotation(title: "King David Kalakaua", locationName: "Waikiki Gateway Park",
//            discipline: "Sculpture", coordinate: CLLocationCoordinate2D(latitude: 21.283921,
//                longitude: -157.831661))
//        mapView.addAnnotation(placeMapAnnotation)
    }
    
    //-------------------------------------------------------------------------------------------
    // MARK: - Public Methods
    //-------------------------------------------------------------------------------------------
    func displayPreviewAreas(previewAreas: PreviewAreas) {
        for item: PreviewArea in previewAreas.items {
            addPreviewAreaAnnotation(item)
        }
    }
    
    func addPreviewAreaAnnotation(previewArea: PreviewArea) {
        let areaMapAnnotation = AreaMapAnnotation(title: previewArea.name, locationName: "", discipline: "Area", coordinate: CLLocationCoordinate2D(latitude: previewArea.location.latitude, longitude: previewArea.location.longitude))
        
        mapView.addAnnotation(areaMapAnnotation)
    }
    
    func centerMapOnLocation(location: CLLocationCoordinate2D) {
        let coordinateRegion = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func checkLocationAuthorizationStatus() {
        if CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse {
            mapView.showsUserLocation = true
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
}