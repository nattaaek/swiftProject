//
//  LogoutViewController.swift
//  swiftProject
//
//  Created by Alzack Connell on 11/17/2560 BE.
//  Copyright © 2560 Alzack Connell. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LogoutViewController: UIViewController {

    var handle: AuthStateDidChangeListenerHandle?
    
    override func viewWillAppear(_ animated: Bool) {
        handle = Auth.auth().addStateDidChangeListener {(auth, user) in
            
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        Auth.auth().removeStateDidChangeListener(handle!)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }



    @IBAction func logoutAction(_ sender: Any) {
        if Auth.auth().currentUser != nil {
            do{
                try Auth.auth().signOut()
                let newViewController = self.storyboard?.instantiateViewController(withIdentifier: "login") as! LoginViewController
                self.present(newViewController, animated: true, completion: nil)
            }catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
}
