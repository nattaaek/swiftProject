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
    var data: [[Double]] = []
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productPredict: UILabel!
    @IBOutlet weak var productDetail: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "bg10.png")?.draw(in: self.view.bounds)
        let imagebg: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: imagebg)
        
        ref = Database.database().reference()
        print(name)
        print(price)
        productName.text = name
        productPrice.text = price
        
        productImage.image = UIImage(named: image)
        handle = ref?.child("price").child(name).observe(.value, with: {(snapshot) in
            var key: Double = 1
            for child in snapshot.children.allObjects {
                let snap = child as! DataSnapshot
                let value = snap.value
                self.data.append([key,value as! Double])
                key = key + 1
            }
            print(self.data)

            let x : Double = 2
            do {
                let prediction = PredictionBuilder(x: x, data: self.data)
                let result = try prediction.build()
                self.predict = result.y
            } catch let msg {
                print(msg)
            }
            self.productPredict.text = String(format: "%.2f", self.predict)
        })

        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addFavoriteAction(_ sender: Any) {
        
    }
}
