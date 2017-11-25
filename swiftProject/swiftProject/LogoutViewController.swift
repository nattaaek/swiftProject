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
    
    @IBOutlet weak var line: UILabel!
    @IBOutlet weak var line2: UILabel!
    @IBOutlet weak var btnLogout: UIButton!
    @IBOutlet weak var copyRight: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        handle = Auth.auth().addStateDidChangeListener {(auth, user) in
            
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        Auth.auth().removeStateDidChangeListener(handle!)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradient = CAGradientLayer()
        let colorTop = UIColor(red: 67/255, green: 206/255, blue: 162/255, alpha: 1).cgColor
        let colorBottom = UIColor(red: 24/255, green: 90/255, blue: 157/255, alpha: 1).cgColor
        
        gradient.colors = [colorTop, colorBottom]
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        gradient.frame = btnLogout.bounds
        gradient.cornerRadius = gradient.frame.height/2
        
        let myGraident = UIImage(named: "textgradient.png")
        line.textColor = UIColor(patternImage: myGraident!)
        line2.textColor = UIColor(patternImage: myGraident!)
        
        btnLogout.layer.masksToBounds = false
        btnLogout.layer.shadowColor = UIColor.black.cgColor
        btnLogout.layer.shadowOpacity = 0.2
        btnLogout.layer.shadowOffset = CGSize(width: 0, height: 5)
        btnLogout.layer.cornerRadius = btnLogout.frame.height/2
        btnLogout.clipsToBounds = true
        btnLogout.layer.shadowPath = UIBezierPath(rect: btnLogout.bounds).cgPath
        btnLogout.layer.shouldRasterize = true
        btnLogout.layer.rasterizationScale = UIScreen.main.scale
        btnLogout.layer.borderWidth = 3
        btnLogout.layer.borderColor = UIColor(red: 205/255, green: 219/255, blue: 232/255, alpha: 1).cgColor
        btnLogout.layer.addSublayer(gradient)
        
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "bg5.png")?.draw(in: self.view.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)
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
