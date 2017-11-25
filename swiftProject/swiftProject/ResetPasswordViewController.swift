//
//  ResetPasswordViewController.swift
//  swiftProject
//
//  Created by Alzack Connell on 11/17/2560 BE.
//  Copyright © 2560 Alzack Connell. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ResetPasswordViewController: UIViewController {
    var handle: AuthStateDidChangeListenerHandle?
    
    @IBOutlet weak var line: UILabel!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnReset: UIButton!
    override func viewWillAppear(_ animated: Bool) {
        handle = Auth.auth().addStateDidChangeListener {(auth, user) in
            
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        Auth.auth().removeStateDidChangeListener(handle!)
    }
    
    @IBOutlet weak var inputEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradient3 = CAGradientLayer()
        let colorTop3 = UIColor(red: 217/255, green: 242/255, blue: 236/255, alpha: 1)
        let colorBottom3 = UIColor(red: 211/255, green: 225/255, blue: 236/255, alpha: 1)
        
        gradient3.colors = [colorTop3, colorBottom3]
        gradient3.startPoint = CGPoint(x: 0, y: 0.5)
        gradient3.endPoint = CGPoint(x: 1, y: 0.5)
        gradient3.frame = inputEmail.bounds
        gradient3.cornerRadius = 15
        
        inputEmail.layer.cornerRadius = 15
        inputEmail.layer.borderWidth = 1
        inputEmail.layer.borderColor = UIColor(red: 211/255, green: 225/255, blue: 236/255, alpha: 1).cgColor
        inputEmail.layer.addSublayer(gradient3)
        
        //button section
        let gradient = CAGradientLayer()
        let colorTop = UIColor(red: 67/255, green: 206/255, blue: 162/255, alpha: 1).cgColor
        let colorBottom = UIColor(red: 24/255, green: 90/255, blue: 157/255, alpha: 1).cgColor
        
        let gradient2 = CAGradientLayer()
        let colorTop2 = UIColor(red: 67/255, green: 206/255, blue: 162/255, alpha: 1).cgColor
        let colorBottom2 = UIColor(red: 24/255, green: 90/255, blue: 157/255, alpha: 1).cgColor
        
        gradient.colors = [colorTop, colorBottom]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradient.frame = btnBack.bounds
        gradient.cornerRadius = gradient.frame.height/2
        
        
        gradient2.colors = [colorTop2, colorBottom2]
        gradient2.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient2.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradient2.frame = btnReset.bounds
        gradient2.cornerRadius = gradient2.frame.height/2
        
        btnBack.layer.masksToBounds = false
        btnBack.layer.shadowColor = UIColor.black.cgColor
        btnBack.layer.shadowOpacity = 0.2
        btnBack.layer.shadowOffset = CGSize(width: 0, height: 5)
        btnBack.layer.cornerRadius = btnBack.frame.height/2
        btnBack.clipsToBounds = true
        btnBack.layer.shadowPath = UIBezierPath(rect: btnBack.bounds).cgPath
        btnBack.layer.shouldRasterize = true
        btnBack.layer.rasterizationScale = UIScreen.main.scale
        btnBack.layer.borderWidth = 3
        btnBack.layer.borderColor = UIColor(red: 205/255, green: 219/255, blue: 232/255, alpha: 1).cgColor
        btnBack.layer.addSublayer(gradient)
        
        btnReset.layer.masksToBounds = false
        btnReset.layer.shadowColor = UIColor.black.cgColor
        btnReset.layer.shadowOpacity = 0.2
        btnReset.layer.shadowOffset = CGSize(width: 0, height: 5)
        btnReset.layer.cornerRadius = btnReset.frame.height/2
        btnReset.clipsToBounds = true
        btnReset.layer.shadowPath = UIBezierPath(rect: btnReset.bounds).cgPath
        btnReset.layer.shouldRasterize = true
        btnReset.layer.rasterizationScale = UIScreen.main.scale
        btnReset.layer.borderWidth = 3
        btnReset.layer.borderColor = UIColor(red: 205/255, green: 219/255, blue: 232/255, alpha: 1).cgColor
        btnReset.layer.addSublayer(gradient2)
        
        // background section
        let myGraident = UIImage(named: "textgradient.png")
        line.textColor = UIColor(patternImage: myGraident!)
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "bg4.png")?.draw(in: self.view.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)
        // Do any additional setup after loading the view.
    }

    @IBAction func loginAction(_ sender: Any) {
        let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "login") as! LoginViewController
        self.present(nextViewController, animated: true, completion: nil)
    }
    @IBAction func resetPasswordAction(_ sender: Any) {
        if self.inputEmail.text == "" {
            let alert = UIAlertController(title: "Error!", message: "Please input your email address", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
        else {
            Auth.auth().sendPasswordReset(withEmail: self.inputEmail.text!, completion: {
                (error) in
                var title = ""
                var message = ""
                
                if error != nil {
                    title = "Error!"
                    message = (error?.localizedDescription)!
                }
                else {
                    title = "Success!"
                    message = "Password reset email seent."
                    self.inputEmail.text = ""
                }
                
                let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel){
                    UIAlertAction in
                    let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "login") as! LoginViewController
                    self.present(nextViewController, animated: true, completion: nil)
                })
                self.present(alert, animated: true, completion: nil)
                
            })
        }
    }

}
