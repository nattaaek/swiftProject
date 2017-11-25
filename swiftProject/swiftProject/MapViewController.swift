//
//  MapViewController.swift
//  swiftProject
//
//  Created by Alzack Connell on 11/24/2560 BE.
//  Copyright © 2560 Alzack Connell. All rights reserved.
//

import UIKit
import GoogleMaps
import FirebaseDatabase

class MapViewController: UIViewController {

    
    var ref:DatabaseReference?
    var handle:DatabaseHandle?
    var handle2:DatabaseHandle?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let camera = GMSCameraPosition.camera(withLatitude: 13.756331, longitude: 100.501765, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        // Do any additional setup after loading the view.
        
        
        ref = Database.database().reference()
        handle = ref?.child("buyer").observe(.value, with: {(snapshot) in
            
            for child in snapshot.children.allObjects {
                let snap = child as! DataSnapshot
                
                let marker = GMSMarker()
                let key = snap.key
                marker.title = key
                self.handle2 = self.ref?.child("buyer").child(key).observe(.value, with: {(snapshot2) in
                    let value = snapshot2.value as? NSDictionary
                    let lat = value?["lat"] as! Double
                    let long = value?["long"] as! Double
                    marker.position = CLLocationCoordinate2DMake(lat, long)
                    marker.snippet = value?["detail"] as? String
                })
                marker.map = mapView
            }
            
        })
    }
    
}
