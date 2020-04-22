//
//  ViewController.swift
//  PROGRAM 777
//
//  Created by Jake McCormick on 4/21/20.
//  Copyright © 2020 Jake McCormick. All rights reserved.
//

import UIKit
import CoreLocation



class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var GPS: UIView!
    
    
    
    
    let locMan: CLLocationManager = CLLocationManager()
    var startLocation: CLLocation!
    
    //pizza wagon coordinates
    let kpizzaLat: CLLocationDegrees = 39.987489
    let kpizzaLong: CLLocationDegrees = -79.8305943
    
    
    
    
    
    func locationManager( _ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let newLocation: CLLocation=locations[0]
        NSLog("Something is happening")
        
        
        if newLocation.horizontalAccuracy >= 0 {
            
            let kpizza:CLLocation = CLLocation(latitude: kpizzaLat, longitude: kpizzaLong)
            
            let delta:CLLocationDistance = kpizza.distance(from: newLocation )
           
            let miles: Double = (delta * 0.000621371) + 0.5
            
            if miles < 3 {
                
                locMan.stopUpdatingLocation()
                
                distanceLabel.text = "Enjoy Pizza Wagon"
            } else {
                let commaDelimited: NumberFormatter = NumberFormatter()
                commaDelimited.numberStyle = NumberFormatter.Style.decimal
                
                GPSLabel.text=commaDelimited.string(from: <#T##NSNumber#>(value: miles))!+"miles to Pizza Wagon"
            }
            
            
            
            {
                else
                
            }
            
            
                
                
             
                
            
            
            
            
            
        }
        
        
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locMan.delegate = self
        locMan.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        locMan.distanceFilter = 1609;
        locMan.requestWhenInUseAuthorization()
        locMan.startUpdatingHeading()
        startLocation = nil
    }


}

