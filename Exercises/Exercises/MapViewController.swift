//
//  MapViewController.swift
//  Exercises
//
//  Created by user1 on 16.07.2018.
//  Copyright © 2018 user1. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate {
    
    var places: [FunkyModel] = []
    
    @IBOutlet weak var MapView: MKMapView!
    let locationManager = CLLocationManager()
    let regionRadius: CLLocationDistance = 1000
    
    var selectedData: FunkyModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        loadPoint()
//        checkLocationAuthorizationStatus()

    }

    private func loadPoint() {
//        let mapItem = MapItem()
//        MapView.addAnnotation(mapItem)
    }

//    private func checkLocationAuthorizationStatus() {
//
//    }

}
