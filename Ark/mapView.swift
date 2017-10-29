//
//  mapView.swift
//  Ark
//
//  Created by Benjamin Odisho on 10/28/17.
//  Copyright © 2017 Benjamin Odisho. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet var mapView: MKMapView!

    var victimCoords = [
        (name: "one", latitude: 29.752223, longitude: -95.221097, role: "victim"),
        (name: "two", latitude: 29.688118, longitude: -95.240667, role: "victim"),
        (name: "three", latitude: 29.688864, longitude: -95.255258, role: "savior"),
        (name: "four", latitude: 29.413096, longitude: -95.019782, role: "victim"),
        (name: "five", latitude: 29.400983, longitude: -95.040896, role: "savior")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshView()
    }
    
    // Determines View For Pins
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        let reuseId = "pin"
        
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId)
        
        if pinView == nil {
            pinView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView!.canShowCallout = true
        }
        else {
            pinView!.annotation = annotation
        }
        let customPointAnnotation = annotation as! CustomPointAnnotation
        pinView?.image = UIImage(named: customPointAnnotation.pinCustomImageName)

        return pinView
    }
    
//    // This delegate method is implemented to respond to taps. It opens the system browser
//    // to the URL specified in the annotationViews subtitle property.
//    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
//        if control == view.rightCalloutAccessoryView {
//            let app = UIApplication.shared
//            if let toOpen = view.annotation?.subtitle! {
//                app.openURL(URL(string: toOpen)!)
//            }
//        }
//    }
//    
    // Function to refresh locations found.
    func refreshView() {
        var annotations = [CustomPointAnnotation]()
        for victim in victimCoords {
            
            // Notice that the float values are being used to create CLLocationDegree values.
            // This is a version of the Double type.
            let lat = CLLocationDegrees(victim.latitude)
            let long = CLLocationDegrees(victim.longitude)
            
            // The lat and long are used to create a CLLocationCoordinates2D instance.
            let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
            
            // Here we create the annotation and set its coordiate, title, and subtitle properties
            let annotation = CustomPointAnnotation()
            annotation.coordinate = coordinate
            annotation.title = "\(victim.name)"
            annotation.pinCustomImageName = victim.role == "victim" ? "Lifeguard" : "Boat";
//                annotation.subtitle = ...
            
            // Finally we place the annotation in an array of annotations.
            annotations.append(annotation)
            self.mapView.addAnnotations(annotations)
        }
    }
}
