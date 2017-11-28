//
//  RegisterViewController.swift
//  swiftProject
//
//  Created by Alzack Connell on 11/17/2560 BE.
//  Copyright © 2560 Alzack Connell. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class RegisterViewController: UIViewController {

    
    @IBOutlet weak var btnEmail: UIButton!
    @IBOutlet weak var line: UILabel!
    
    
    @IBAction func email_register(_ sender: Any) {
        // declare varaible story board to emailviewcontroller
        let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "email_register") as! EmailRegisterViewController
        // show email view controller
        self.present(nextViewController, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // gradient section
        let gradient = CAGradientLayer()
        let colorTop = UIColor(red: 67/255, green: 206/255, blue: 162/255, alpha: 1).cgColor
        let colorBottom = UIColor(red: 24/255, green: 90/255, blue: 157/255, alpha: 1).cgColor
        
        gradient.colors = [colorTop, colorBottom]
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        gradient.frame = btnEmail.bounds
        gradient.cornerRadius = gradient.frame.height/2
        
        // line section
        let myGraident = UIImage(named: "textgradient.png")
        line.textColor = UIColor(patternImage: myGraident!)
        
        // btn Email cornerRadius
        btnEmail.layer.cornerRadius = btnEmail.frame.height/2
        //
        btnEmail.clipsToBounds = true
        // btn Border width
        btnEmail.layer.borderWidth = 3
        // btn email colour border
        btnEmail.layer.borderColor = UIColor(red: 205/255, green: 219/255, blue: 232/255, alpha: 1).cgColor
        // add gradient to btn email
        btnEmail.layer.addSublayer(gradient)
        
        // background resposive
        UIGraphicsBeginImageContext(self.view.frame.size)
        // insert background image
        UIImage(named: "bg2.png")?.draw(in: self.view.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        // show background image
        self.view.backgroundColor = UIColor(patternImage: image)

        
    }
    @IBAction func loginAction(_ sender: Any) {
        let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "login") as! LoginViewController
        self.present(nextViewController, animated: true, completion: nil)
    }
}
