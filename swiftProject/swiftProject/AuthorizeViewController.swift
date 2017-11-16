//
//  AuthorizeViewController.swift
//  swiftProject
//
//  Created by Alzack Connell on 11/17/2560 BE.
//  Copyright © 2560 Alzack Connell. All rights reserved.
//

import UIKit

class AuthorizeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // change view to register viewcontroller
    @IBAction func signup(_ sender: Any) {
        let vc = UIStoryboard(name: "welcome", bundle: nil)
        let newViewController = vc.instantiateViewController(withIdentifier: "register") as! RegisterViewController
        self.present(newViewController, animated: true, completion: nil)
    }
}
