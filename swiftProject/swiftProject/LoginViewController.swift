//
//  LoginViewController.swift
//  swiftProject
//
//  Created by Alzack Connell on 11/17/2560 BE.
//  Copyright © 2560 Alzack Connell. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth


class LoginViewController: UIViewController {
    

    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var line: UILabel!
    @IBOutlet weak var txtPassword: UITextField!
    var handle: AuthStateDidChangeListenerHandle?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradient = CAGradientLayer()
        let colorTop = UIColor(red: 67/255, green: 206/255, blue: 162/255, alpha: 1).cgColor
        let colorBottom = UIColor(red: 24/255, green: 90/255, blue: 157/255, alpha: 1).cgColor
        
        gradient.colors = [colorTop, colorBottom]
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        gradient.frame = btnLogin.bounds
        gradient.cornerRadius = gradient.frame.height/2
        
        let myGraident = UIImage(named: "textgradient.png")
        line.textColor = UIColor(patternImage: myGraident!)
        
        btnLogin.layer.masksToBounds = false
        btnLogin.layer.shadowColor = UIColor.black.cgColor
        btnLogin.layer.shadowOpacity = 0.2
        btnLogin.layer.shadowOffset = CGSize(width: 0, height: 5)
        btnLogin.layer.cornerRadius = btnLogin.frame.height/2
        btnLogin.clipsToBounds = true
        btnLogin.layer.shadowPath = UIBezierPath(rect: btnLogin.bounds).cgPath
        btnLogin.layer.shouldRasterize = true
        btnLogin.layer.rasterizationScale = UIScreen.main.scale
        btnLogin.layer.borderWidth = 3
        btnLogin.layer.borderColor = UIColor(red: 205/255, green: 219/255, blue: 232/255, alpha: 1).cgColor
        btnLogin.layer.addSublayer(gradient)

        // textbox section
        
        let gradient2 = CAGradientLayer()
        let colorTop2 = UIColor(red: 217/255, green: 242/255, blue: 236/255, alpha: 1)
        let colorBottom2 = UIColor(red: 211/255, green: 225/255, blue: 236/255, alpha: 1)
        
        gradient2.colors = [colorTop2, colorBottom2]
        gradient2.startPoint = CGPoint(x: 0, y: 0.5)
        gradient2.endPoint = CGPoint(x: 1, y: 0.5)
        gradient2.frame = txtUser.bounds
        gradient2.cornerRadius = 15
        
        txtUser.layer.cornerRadius = 15
        txtUser.layer.borderWidth = 1
        txtUser.layer.borderColor = UIColor(red: 211/255, green: 225/255, blue: 236/255, alpha: 1).cgColor
        txtUser.layer.addSublayer(gradient2)
        
        txtPassword.layer.cornerRadius = 15
        txtPassword.layer.borderWidth = 1
        txtPassword.layer.borderColor = UIColor(red: 211/255, green: 225/255, blue: 236/255, alpha: 1).cgColor
        // Background section
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "bg3.png")?.draw(in: self.view.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        handle = Auth.auth().addStateDidChangeListener {(auth, user) in
            
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        Auth.auth().removeStateDidChangeListener(handle!)
    }
    
    @IBAction func resetPasswordAction(_ sender: Any) {
        let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "reset_password") as! ResetPasswordViewController
        self.present(nextViewController, animated: true, completion: nil)
    }
    @IBAction func registerAction(_ sender: Any) {
        let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "register") as! RegisterViewController
        self.present(nextViewController, animated: true, completion: nil)
    }
    @IBOutlet weak var inputPassword: UITextField!
    @IBOutlet weak var inputUsername: UITextField!
    @IBAction func loginAction(_ sender: Any) {
        if inputUsername.text == "" || inputPassword.text == "" {
            let alert = UIAlertController(title: "Error", message: "Please enter an email and password", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
        else{
            Auth.auth().signIn(withEmail: self.inputUsername.text!, password: self.inputPassword.text!) { (user, error) in
                
                if error == nil {
                    print("login suceesfully")
                    
                    let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "tab") as! UITabBarController
                    self.present(nextViewController, animated: true, completion: nil)
                }
                else {
                    let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    
                    self.present(alert, animated: true, completion: nil)
                }
                
            }
            
            
        }
    }
}

