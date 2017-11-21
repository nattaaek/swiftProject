//
//  ProductDetailViewController.swift
//  swiftProject
//
//  Created by Alzack Connell on 11/19/2560 BE.
//  Copyright © 2560 Alzack Connell. All rights reserved.
//

import UIKit
import PredictionBuilder
import FirebaseDatabase

class ProductDetailViewController: UIViewController {

    var name = ""
    var price = ""
    var image = ""
    var predict: Double = 0
    
    var ref:DatabaseReference?
    var handle:DatabaseHandle?
    
    var productDate:[String] = []
    var productPrices:[Double] = []
    
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productPredict: UILabel!
    @IBOutlet weak var productDetail: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        productName.text = name
        productPrice.text = price
        productImage.image = UIImage(named: image)
        handle = ref?.child("price").child(name).observe(.value, with: {(snapshot) in
        
            for child in snapshot.children.allObjects {
                let snap = child as! DataSnapshot
                let key = snap.key
                self.productDate.append(key)
                let value = snap.value
                self.productPrices.append(value as! Double)
            }

            
        })
        let data: [[Double]] = [[1,15],[2,11],[3,11],[4,11],[5,15.25],[6,17],[7,16.25],[8,16],[9,13],[10,12]]
        let x : Double = 2
        do {
            let prediction = PredictionBuilder(x: x, data: data)
            let result = try prediction.build()
            predict = result.y
        } catch let msg {
            print(msg)
        }
        productPredict.text = String(format: "%.2f", predict)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addFavoriteAction(_ sender: Any) {
        
    }
}
