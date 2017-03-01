//
//  DAO.swift
//  AppleMaps
//
//  Created by Aditya Narayan on 3/1/17.
//
//

import Foundation
import MapKit

protocol MapReloadDelegate {
    func reloadMap()
}


class DAO {
    
    static let sharedInstance = DAO()
    var annotations = [CustomAnnotation]()
    var delegate : MapReloadDelegate?
    
    
    func searchForPlaces(searchText: String, region: MKCoordinateRegion) {
        let request = MKLocalSearchRequest()
        request.naturalLanguageQuery = searchText
        request.region = region
        
        let search = MKLocalSearch(request: request)
        
        search.start { (response, error) in
            guard let response = response else {
                print("Search error: \(error)")
                return
            }
            
            for item in response.mapItems {
                
                let newAnnotation = CustomAnnotation(coordinate: item.placemark.coordinate, title: item.name, subtitle: item.phoneNumber, url: item.url)
                
                
                self.annotations.append(newAnnotation)
            }
            self.delegate?.reloadMap()
        }
    }
    
}






