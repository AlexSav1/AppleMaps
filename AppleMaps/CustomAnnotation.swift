//
//  CustomAnnotation.swift
//  AppleMaps
//
//  Created by Aditya Narayan on 2/28/17.
//
//

import UIKit
import MapKit

class CustomAnnotation: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    var url : String?
    
    init(coordinate: CLLocationCoordinate2D ,title: String, subtitle: String, url: String) {
       
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        self.url = url
    }

}
