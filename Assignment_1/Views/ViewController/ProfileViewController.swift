//
//  ProfileViewController.swift
//  Assignment_1
//
//  Created by Josh on 7/10/20.
//  Copyright © 2020 Vinh Tran. All rights reserved.
//

import UIKit
import MapKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate {
    
    // Profile view variables and outlets
    @IBOutlet weak var yourProfile: UILabel!
    @IBOutlet weak var booksFinished: UILabel!
    @IBOutlet weak var booksFinishedCount: UILabel!
    @IBOutlet weak var favouriteBooks: UILabel!
    @IBOutlet weak var favouriteBooksTable: UITableView!
    let bookManager = BookManager.shared
    
    // MapView variables and outlets
    @IBOutlet weak var mapView: MKMapView!
    var bookStores: [MKPointAnnotation] = []
    let locationManager = CLLocationManager()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookManager.favouriteCount()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favouriteBookCell", for: indexPath)
        let title = cell.viewWithTag(1000) as! UILabel
        let author = cell.viewWithTag(1001) as! UILabel
        let progress = cell.viewWithTag(1002) as! UILabel
        let progressView = cell.viewWithTag(1003) as! UIProgressView
        let bookImage = cell.viewWithTag(1004) as! UIImageView
        let book = bookManager.getFavourite(index: indexPath.row)
        let currentProgress: Float = Float(book.currentPage) / Float(book.totalPages)
        if let photo = book.photo{
            bookImage.image = UIImage(data: photo)
        }
        title.text = book.title
        author.text = book.author
        progress.text = "Page \(book.currentPage) of \(book.totalPages)"
        progressView.setProgress(currentProgress, animated: true)
        return cell
    }

    // delete cell
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            bookManager.removeFavourite(rowIndex: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        favouriteBooksTable.reloadData()
        booksFinishedCount.text = String(bookManager.favouriteCount())
    }

    @IBAction func addBook(_ sender: Any) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.didDragMap(_:)))
        panGesture.delegate = self
        mapView.addGestureRecognizer(panGesture)
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        favouriteBooksTable.delegate = self
        favouriteBooksTable.dataSource = self
        booksFinishedCount.text = String(bookManager.favouriteCount())
        bookManager.fetchBooks()
        bookManager.loadFavourites()
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let _ = sender as? UITableViewCell else {
            return
        }
        guard let selectedRow = self.favouriteBooksTable.indexPathForSelectedRow else {
            return
        }
        let destination = segue.destination as? BookDetailViewController
        let selectedBook = bookManager.getFavourite(index: selectedRow.row)
        destination!.book = selectedBook
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    @objc func didDragMap(_ sender: UIGestureRecognizer) {
        if sender.state == .ended {
            searchMapAreaForBookStores()
        }
    }
}

extension ProfileViewController : CLLocationManagerDelegate {
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
