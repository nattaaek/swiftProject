//
//  AuthorizeViewController.swift
//  swiftProject
//
//  Created by Alzack Connell on 11/17/2560 BE.
//  Copyright © 2560 Alzack Connell. All rights reserved.
//

import UIKit

class AuthorizeViewController: UIViewController {

    @IBOutlet weak var signIn: UIButton!
    @IBOutlet weak var signUp: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Button section
        let gradient = CAGradientLayer()
        let colorTop = UIColor(red: 67/255, green: 206/255, blue: 162/255, alpha: 1).cgColor
        let colorBottom = UIColor(red: 24/255, green: 90/255, blue: 157/255, alpha: 1).cgColor
        
        let gradient2 = CAGradientLayer()
        let colorTop2 = UIColor(red: 67/255, green: 206/255, blue: 162/255, alpha: 1).cgColor
        let colorBottom2 = UIColor(red: 24/255, green: 90/255, blue: 157/255, alpha: 1).cgColor
        
        gradient.colors = [colorTop, colorBottom]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradient.frame = signIn.bounds
        gradient.cornerRadius = gradient.frame.height/2
        
        
        gradient2.colors = [colorTop2, colorBottom2]
        gradient2.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient2.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradient2.frame = signUp.bounds
        gradient2.cornerRadius = gradient2.frame.height/2
        
        signIn.layer.masksToBounds = false
        signIn.layer.shadowColor = UIColor.black.cgColor
        signIn.layer.shadowOpacity = 0.2
        signIn.layer.shadowOffset = CGSize(width: 0, height: 5)
        signIn.layer.cornerRadius = signIn.frame.height/2
        signIn.clipsToBounds = true
        signIn.layer.shadowPath = UIBezierPath(rect: signIn.bounds).cgPath
        signIn.layer.shouldRasterize = true
        signIn.layer.rasterizationScale = UIScreen.main.scale
        signIn.layer.borderWidth = 3
        signIn.layer.borderColor = UIColor(red: 205/255, green: 219/255, blue: 232/255, alpha: 1).cgColor
        signIn.layer.addSublayer(gradient)
        
        signUp.layer.masksToBounds = false
        signUp.layer.shadowColor = UIColor.black.cgColor
        signUp.layer.shadowOpacity = 0.2
        signUp.layer.shadowOffset = CGSize(width: 0, height: 5)
        signUp.layer.cornerRadius = signUp.frame.height/2
        signUp.clipsToBounds = true
        signUp.layer.shadowPath = UIBezierPath(rect: signUp.bounds).cgPath
        signUp.layer.shouldRasterize = true
        signUp.layer.rasterizationScale = UIScreen.main.scale
        signUp.layer.borderWidth = 3
        signUp.layer.borderColor = UIColor(red: 205/255, green: 219/255, blue: 232/255, alpha: 1).cgColor
        signUp.layer.addSublayer(gradient2)
        

        
        // Background section
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "bg1.png")?.draw(in: self.view.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)
        // Do any additional setup after loading the view.
        
    }
    
    // change view to register viewcontroller
    @IBAction func signup(_ sender: Any) {
        let newViewController = self.storyboard?.instantiateViewController(withIdentifier: "register") as! RegisterViewController
        self.present(newViewController, animated: true, completion: nil)
    }
    
    
    @IBAction func login(_ sender: Any) {
        let newViewController = self.storyboard?.instantiateViewController(withIdentifier: "login") as! LoginViewController
        self.present(newViewController, animated: true, completion: nil)
    }
}
