//
//  ProductViewController.swift
//  swiftProject
//
//  Created by Alzack Connell on 11/18/2560 BE.
//  Copyright © 2560 Alzack Connell. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ProductViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collection: UICollectionView!
    
    var userChose = ""
    
    var ref:DatabaseReference?
    var handle:DatabaseHandle?
    var handle2:DatabaseHandle?
    var productImage:[String] = []
    var productName:[String] = []
    var productPrice:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "bg9.png")?.draw(in: self.view.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)

        collection.delegate = self
        collection.dataSource = self
        ref = Database.database().reference()
         handle = ref?.child("product").child(userChose).observe(.value, with: {(snapshot) in
         
         for child in snapshot.children.allObjects {
         let snap = child as! DataSnapshot
         let key = snap.key
            self.productName.append(key)
            self.collection.reloadData()
        self.handle2 = (self.ref?.child("product").child(self.userChose).child(key).observe(.value, with: {(snapshot2) in
         
         let value = snapshot2.value as? NSDictionary
         
         let img = value?["img"] as? String ?? ""
            self.productImage.append(img)
            self.collection.reloadData()
         let price = value?["price"] as? String ?? ""
            self.productPrice.append(price + " Baht")
            self.collection.reloadData()
        
         }))!
            
         }
            
         })
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productPrice.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ProductCollectionViewCell
        
        cell.layer.borderWidth = 2
        cell.layer.borderColor = UIColor(red: 218/255, green: 245/255, blue: 236/255, alpha: 1.0).cgColor
        cell.layer.backgroundColor = UIColor.white.cgColor
        cell.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOpacity = 0.3
        cell.layer.shadowOffset = CGSize(width: 10, height: 10)
        cell.layer.shadowRadius = 5
        
        cell.layer.shadowPath = UIBezierPath(rect: cell.bounds).cgPath
        cell.layer.shouldRasterize = true
        cell.layer.rasterizationScale = UIScreen.main.scale
        
        
        cell.productName.text = productName[indexPath.row]
        cell.productPrice.text = productPrice[indexPath.row]
        cell.productImage.image = UIImage(named: productImage[indexPath.row] + ".png")
        return cell
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UICollectionViewCell,
            let indexPath = self.collection.indexPath(for: cell) {
            let vc = segue.destination as! ProductDetailViewController
            
            vc.name = productName[indexPath.row] as String
            vc.price = productPrice[indexPath.row] as String
            vc.image = productImage[indexPath.row] as String
        }
    }
}
