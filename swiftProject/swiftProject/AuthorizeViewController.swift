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
            // Gradient button SignIn
        let gradient = CAGradientLayer()
        let colorTop = UIColor(red: 67/255, green: 206/255, blue: 162/255, alpha: 1).cgColor
        let colorBottom = UIColor(red: 24/255, green: 90/255, blue: 157/255, alpha: 1).cgColor
            // Gradient button SignUp
        let gradient2 = CAGradientLayer()
        let colorTop2 = UIColor(red: 67/255, green: 206/255, blue: 162/255, alpha: 1).cgColor
        let colorBottom2 = UIColor(red: 24/255, green: 90/255, blue: 157/255, alpha: 1).cgColor
        // colours in gradient
        gradient.colors = [colorTop, colorBottom]
        // start Point gradient
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        // end Point gradient
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        // size of gradient
        gradient.frame = signIn.bounds
        // Radius size of gradient
        gradient.cornerRadius = gradient.frame.height/2
        
        // colours of gradient
        gradient2.colors = [colorTop2, colorBottom2]
        // start point of gradient
        gradient2.startPoint = CGPoint(x: 0.0, y: 0.5)
        // end point of gradient
        gradient2.endPoint = CGPoint(x: 1.0, y: 0.5)
        // size of gradient refer by signUp button
        gradient2.frame = signUp.bounds
        // gradient Radius
        gradient2.cornerRadius = gradient2.frame.height/2
        
     // Sign in Button section
        // signIn button cornerRadius
        signIn.layer.cornerRadius = signIn.frame.height/2
        // signIn button can use other layer to clip
        signIn.clipsToBounds = true
        // width of border Sign-in
        signIn.layer.borderWidth = 3
        // colour of border sign-in
        signIn.layer.borderColor = UIColor(red: 205/255, green: 219/255, blue: 232/255, alpha: 1).cgColor
        // make gradient to signIn
        signIn.layer.addSublayer(gradient)
     
        
      // Sign up button section
        // signUp button cornerRadius
        signUp.layer.cornerRadius = signUp.frame.height/2
        // signUp button can use other layer to clip
        signUp.clipsToBounds = true
        // width of border Sign-up
        signUp.layer.borderWidth = 3
        // colour of border Sign-up
        signUp.layer.borderColor = UIColor(red: 205/255, green: 219/255, blue: 232/255, alpha: 1).cgColor
        // make gradient to signup
        signUp.layer.addSublayer(gradient2)
        

        
    // Background section
        // responsive image of background
        UIGraphicsBeginImageContext(self.view.frame.size)
        // insert background image to view
        UIImage(named: "bg1.png")?.draw(in: self.view.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        // set background image to view controller
        self.view.backgroundColor = UIColor(patternImage: image)
        // Do any additional setup after loading the view.
        
    }
    
    // change view to register viewcontroller
    @IBAction func signup(_ sender: Any) {
        // declare variable
        let newViewController = self.storyboard?.instantiateViewController(withIdentifier: "register") as! RegisterViewController
        // show next view controller
        self.present(newViewController, animated: true, completion: nil)
    }
    
    
    @IBAction func login(_ sender: Any) {
        // declare variable
        let newViewController = self.storyboard?.instantiateViewController(withIdentifier: "login") as! LoginViewController
        // show next view controller
        self.present(newViewController, animated: true, completion: nil)
    }
}
