//
//  ViewController.swift
//  Where am I?
//
//  Created by Patrick Landin on 12/18/14.
//  Copyright (c) 2014 Patrick Landin. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    
    @IBOutlet weak var Latitude: UILabel!
    @IBOutlet weak var Longitude: UILabel!
    @IBOutlet weak var Heading: UILabel!
    @IBOutlet weak var Speed: UILabel!
    @IBOutlet weak var Altitude: UILabel!
    @IBOutlet weak var Address: UILabel!
    
        var manager:CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager = CLLocationManager()
        self.manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()

    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
        var userLocation : CLLocation = locations[0] as CLLocation
        
        Latitude.text = "\(userLocation.coordinate.latitude)"
        Longitude.text = "\(userLocation.coordinate.longitude)"
        Heading.text = "\(userLocation.course)"
        Speed.text = "\(userLocation.speed)"
        Altitude.text = "\(userLocation.altitude)"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

