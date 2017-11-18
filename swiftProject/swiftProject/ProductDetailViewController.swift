//
//  ProductDetailViewController.swift
//  swiftProject
//
//  Created by Alzack Connell on 11/19/2560 BE.
//  Copyright © 2560 Alzack Connell. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {

    var name = ""
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productPredict: UILabel!
    @IBOutlet weak var productDetail: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productName.text = name

        // Do any additional setup after loading the view.
    }
    @IBAction func addFavoriteAction(_ sender: Any) {
        
    }
}
