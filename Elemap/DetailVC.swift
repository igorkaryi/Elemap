//
//  DetailVC.swift
//  Elemap
//
//  Created by Igor Karyi on 13.01.2018.
//  Copyright © 2018 Igor Karyi. All rights reserved.
//

import UIKit
import GoogleMaps

class DetailVC: UIViewController {
    
    @IBOutlet weak var detailMapView: UIView!
    
    var titlePlace: String!
    var latitudePlace: Double!
    var longitudePlace: Double!
    
    
    var mapView:GMSMapView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView = GMSMapView.map(withFrame: CGRect(x: 0, y: 0, width: 400, height: 700), camera: GMSCameraPosition.camera(withLatitude: 50.3935443, longitude: 30.6026959, zoom: 12))

        mapView?.center = self.view.center
        
        self.view.addSubview(mapView!)

        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: latitudePlace, longitude: longitudePlace)
        marker.title = titlePlace!
        marker.icon = UIImage(named: "batary")
        marker.snippet = "Kiev"
        marker.map = mapView
        
        print("PlacesTitle", titlePlace!)
        print("PlacesLatitude", latitudePlace!)
        print("PlacesLongitude", longitudePlace!)
    }
    
    

}
