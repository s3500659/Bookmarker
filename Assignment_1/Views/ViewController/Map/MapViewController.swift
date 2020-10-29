//
//  MapViewController.swift
//  Assignment_1
//
//  Created by admin on 29/10/20.
//  Copyright © 2020 Vinh Tran. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, UIGestureRecognizerDelegate{
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    

    @IBOutlet weak var mapView: MKMapView!
    
    var bookStores: [MKPointAnnotation] = []
    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
              let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.didDragMap(_:)))
              panGesture.delegate = self
              mapView.addGestureRecognizer(panGesture)
              
              locationManager.delegate = self
              locationManager.desiredAccuracy = kCLLocationAccuracyBest
              locationManager.requestWhenInUseAuthorization()
              locationManager.requestLocation()
    }
    
    
    //MARK: Map
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
          return true
      }
      
      @objc func didDragMap(_ sender: UIGestureRecognizer) {
          if sender.state == .ended {
              searchMapAreaForBookStores()
          }
      }
}

extension MapViewController : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if (status == .authorizedWhenInUse || status == .authorizedAlways) {
            locationManager.requestLocation()
        }
        else {
            let alert = UIAlertController(title: "Location Permission", message: "Location access is required to show Book stores close to you, please enable this in Settings", preferredStyle: .alert)
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            let region = MKCoordinateRegion(center: location.coordinate, span: span)
            searchMapAreaForBookStores()
            mapView.setRegion(region, animated: true)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error:: \(error)")
    }
    
    // MARK: Private functions
    
    private func searchMapAreaForBookStores() {
        mapView.removeAnnotations(bookStores)
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = "book store"
        request.region = mapView.region
        let search = MKLocalSearch(request: request)
        search.start { response, _ in guard let response = response else { return }
            for item in response.mapItems {
                let annotation = MKPointAnnotation()
                annotation.title = item.name
                annotation.subtitle = "\(item.placemark.subThoroughfare ?? "") \(item.placemark.thoroughfare ?? "")"
                annotation.coordinate = item.placemark.location!.coordinate
                self.bookStores.append(annotation)
                self.mapView.addAnnotation(annotation)
            }
            self.mapView.reloadInputViews()
        }
    }
}


