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

    
    var productImage:[String] = []
    var productName:[String] = []
    var productPrice:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(userChose)
      /*  collection.delegate = self
        collection.dataSource = self

        ref = Database.database().reference()*/
        /*let handle = ref?.child("product").child(userChose)
        
        handle?.observeSingleEvent(of: .childAdded, with: {(snapshot) in
            
            if let productDict = snapshot.value as? [String:Any] {
                print(productDict["name"])
            }
            
        })*/
   
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ProductCollectionViewCell
        cell.productName.text = productName[indexPath.row]
        cell.productImage.image = UIImage(named: productImage[indexPath.row])
        cell.productPrice.text = productPrice[indexPath.row]
        
        return cell
    }

    
    
}
