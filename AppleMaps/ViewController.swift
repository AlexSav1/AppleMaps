//
//  ViewController.swift
//  AppleMaps
//
//  Created by Aditya Narayan on 2/28/17.
//
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet var mapView: MKMapView!
    var locationManager: CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.mapView.delegate = self
        
        self.locationManager = CLLocationManager()
        self.locationManager?.delegate = self
        self.locationManager?.requestWhenInUseAuthorization()
        self.locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        self.mapView.showsUserLocation = true
        
        //adding pins
        let turnToTech = CustomAnnotation(coordinate: CLLocationCoordinate2D.init(latitude: 40.709037222006089, longitude: -74.01494278579392), title: "TurnToTech", subtitle: "Mobile dev school", url: "https://turntotech.io")
        
        
        
        self.mapView.addAnnotation(turnToTech)
        
        //zoom in on pin
        let region = MKCoordinateRegionMakeWithDistance(turnToTech.coordinate, 250, 250)
        self.mapView.setRegion(region, animated: true)

    }

    
    @IBAction func setMap(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            self.mapView.mapType = .standard
            break
        case 1:
            self.mapView.mapType = .hybrid
            break
        case 2:
            self.mapView.mapType = .satellite
            break
        default:
            break
        }
        
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        
        print("Location: \(userLocation.location?.coordinate.latitude), \(userLocation.location?.coordinate.longitude)")
        
//        let region = MKCoordinateRegionMakeWithDistance((userLocation.location?.coordinate)!, 250, 250)
//        self.mapView.setRegion(region, animated: true)
    }

        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            
            //let annotationView: MKAnnotationView? = nil
            
            
            let identifier = "pin"
            
            //annotation.title = "Hello"

            
            var annView: MKPinAnnotationView? = self.mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as! MKPinAnnotationView?
            
            if(annView == nil){
                annView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            }
            
//            let deleteButton = UIButton.init(type: UIButtonType.custom) as UIButton
//            deleteButton.frame.size.width = 44
//            deleteButton.frame.size.height = 44
//            deleteButton.backgroundColor = UIColor.red
//            deleteButton.setImage(UIImage(named: "logo"), for: .normal)
            
            let detailButton = UIButton(type: .detailDisclosure)
            let leftIconView = UIImageView(image: UIImage.init(named: "logo"))
            leftIconView.frame.size.width = 44
            leftIconView.frame.size.height = 44
            
            annView?.leftCalloutAccessoryView = leftIconView
            annView?.rightCalloutAccessoryView = detailButton
            annView?.canShowCallout = true
            annView?.animatesDrop = true
            
            return annView
        }

    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        print(view, "tapped")

        let webVC = WebViewController()
        webVC.selectedAnnotation = view.annotation as! CustomAnnotation?
        self.present(webVC, animated: true){
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}





















