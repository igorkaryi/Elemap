//
//  ViewController.swift
//  Elemap
//
//  Created by Igor Karyi on 13.01.2018.
//  Copyright © 2018 Igor Karyi. All rights reserved.
//

import UIKit
import GoogleMaps

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var myTableView: UITableView!
    
    @IBOutlet weak var myMapView: UIView!
    
    var titlePlacesArray = ["Apple", "Apricot", "Banana", "Blueberry", "Cantaloupe", "Cherry",
                  "Clementine", "Coconut", "Cranberry", "Fig", "Grape", "Grapefruit",
                  "Kiwi fruit", "Lemon", "Lime", "Lychee", "Mandarine", "Mango",
                  "Melon", "Nectarine", "Olive", "Orange", "Papaya", "Peach",
                  "Pear", "Pineapple", "Raspberry", "Strawberry"]
    
    var coordinatePlacesLatitudeArray = ["50.4462579", "Banana", "Blueberry", "Cantaloupe", "Cherry",
                  "Clementine", "Coconut", "Cranberry", "Fig", "Grape", "Grapefruit",
                  "Kiwi fruit", "Lemon", "Lime", "Lychee", "Mandarine", "Mango",
                  "Melon", "Nectarine", "Olive", "Orange", "Papaya", "Peach",
                  "Pear", "Pineapple", "Raspberry", "Strawberry"]
    
    var coordinatePlacesLongitudeArray = ["30.5150747", "Banana", "Blueberry", "Cantaloupe", "Cherry",
                                 "Clementine", "Coconut", "Cranberry", "Fig", "Grape", "Grapefruit",
                                 "Kiwi fruit", "Lemon", "Lime", "Lychee", "Mandarine", "Mango",
                                 "Melon", "Nectarine", "Olive", "Orange", "Papaya", "Peach",
                                 "Pear", "Pineapple", "Raspberry", "Strawberry"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: 50.3935443, longitude: 30.6026959, zoom: 12.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
        myMapView = mapView
        
        // Creates a marker in the center of the map.50.3935443,30.6026959
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 50.3935443, longitude: 30.6026959)
        marker.title = "Kiev"
        marker.icon = UIImage(named: "batary")
        marker.snippet = "Kiev"
        marker.map = mapView
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return titlePlacesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = titlePlacesArray[indexPath.row]
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailVC" {
            if let indexPath = myTableView.indexPathForSelectedRow {
                let detailVC = segue.destination as! DetailVC
                detailVC.titlePlace = titlePlacesArray[indexPath.row]
                detailVC.latitudePlace = Double(coordinatePlacesLatitudeArray[indexPath.row])
                detailVC.longitudePlace = Double(coordinatePlacesLongitudeArray[indexPath.row])
            }
        }
    }
    
}

