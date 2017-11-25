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
        let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "email_register") as! EmailRegisterViewController
        self.present(nextViewController, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradient = CAGradientLayer()
        let colorTop = UIColor(red: 67/255, green: 206/255, blue: 162/255, alpha: 1).cgColor
        let colorBottom = UIColor(red: 24/255, green: 90/255, blue: 157/255, alpha: 1).cgColor
        
        gradient.colors = [colorTop, colorBottom]
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        gradient.frame = btnEmail.bounds
        gradient.cornerRadius = gradient.frame.height/2
        
        let myGraident = UIImage(named: "textgradient.png")
        line.textColor = UIColor(patternImage: myGraident!)
        
        btnEmail.layer.masksToBounds = false
        btnEmail.layer.shadowColor = UIColor.black.cgColor
        btnEmail.layer.shadowOpacity = 0.2
        btnEmail.layer.shadowOffset = CGSize(width: 0, height: 5)
        btnEmail.layer.cornerRadius = btnEmail.frame.height/2
        btnEmail.clipsToBounds = true
        btnEmail.layer.shadowPath = UIBezierPath(rect: btnEmail.bounds).cgPath
        btnEmail.layer.shouldRasterize = true
        btnEmail.layer.rasterizationScale = UIScreen.main.scale
        btnEmail.layer.borderWidth = 3
        btnEmail.layer.borderColor = UIColor(red: 205/255, green: 219/255, blue: 232/255, alpha: 1).cgColor
        btnEmail.layer.addSublayer(gradient)
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "bg2.png")?.draw(in: self.view.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)

        
    }
    @IBAction func loginAction(_ sender: Any) {
        let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "login") as! LoginViewController
        self.present(nextViewController, animated: true, completion: nil)
    }
}
