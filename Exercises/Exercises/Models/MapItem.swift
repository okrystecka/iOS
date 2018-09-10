//
//  MapModel.swift
//  Exercises
//
//  Created by user1 on 16.07.2018.
//  Copyright © 2018 user1. All rights reserved.
//

import Foundation
import MapKit

class MapItem: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    
    let funky: FunkyModel
    
    init(funky: FunkyModel){
        self.funky = funky
        self.coordinate = CLLocationCoordinate2D(latitude: funky.coordinate[0], longitude: funky.coordinate[1])
        super.init()
    }
    
    var title: String? {
        return funky.title
    }
}
