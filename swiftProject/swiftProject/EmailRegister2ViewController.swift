//
//  EmailRegister2ViewController.swift
//  swiftProject
//
//  Created by Alzack Connell on 11/17/2560 BE.
//  Copyright © 2560 Alzack Connell. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class EmailRegister2ViewController: UIViewController {

    @IBOutlet weak var line: UILabel!
    @IBOutlet weak var btnSignUp: UIButton!
    var inputEmail = ""
    var inputPhone = ""
    // firebase handle listener
    var handle: AuthStateDidChangeListenerHandle?
    
    
    
    @IBOutlet weak var inputConfirmPassword: UITextField!
    @IBOutlet weak var inputPassword: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        
        handle = Auth.auth().addStateDidChangeListener {(auth, user) in
            
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        Auth.auth().removeStateDidChangeListener(handle!)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // button section
        let gradient = CAGradientLayer()
        let colorTop = UIColor(red: 67/255, green: 206/255, blue: 162/255, alpha: 1).cgColor
        let colorBottom = UIColor(red: 24/255, green: 90/255, blue: 157/255, alpha: 1).cgColor
        
        gradient.colors = [colorTop, colorBottom]
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        gradient.frame = btnSignUp.bounds
        gradient.cornerRadius = gradient.frame.height/2
        
        let myGraident = UIImage(named: "textgradient.png")
        line.textColor = UIColor(patternImage: myGraident!)
        
        btnSignUp.layer.cornerRadius = btnSignUp.frame.height/2
        btnSignUp.clipsToBounds = true
        btnSignUp.layer.borderWidth = 3
        btnSignUp.layer.borderColor = UIColor(red: 205/255, green: 219/255, blue: 232/255, alpha: 1).cgColor
        btnSignUp.layer.addSublayer(gradient)
        
        
         // background section
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "bg6.png")?.draw(in: self.view.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginAction(_ sender: Any) {
        let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "login") as! LoginViewController
        self.present(nextViewController, animated: true, completion: nil)
    }
    @IBAction func signupAction(_ sender: Any) {
        
        if  inputPassword.text! == "" || inputConfirmPassword.text! == "" {
            let alert = UIAlertController(title: "Error", message: "Please fill all information please!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if inputPassword.text! != inputConfirmPassword.text! {
            let alert = UIAlertController(title: "Error", message: "please make sure your password and confirm password is match", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else {
            Auth.auth().createUser(withEmail: inputEmail, password: inputPassword.text!) { (user,error) in
                
                if error == nil {
                    let newViewController = self.storyboard?.instantiateViewController(withIdentifier: "welcome") as! AuthorizeViewController
                    self.present(newViewController, animated: true, completion: nil)
                }
                else {
                    let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert )
                    alert.addAction(UIAlertAction(title: "OK", style: .cancel) { UIAlertAction in
                        let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "email_register") as! EmailRegisterViewController
                        self.present(nextViewController, animated: true, completion: nil)
                    })
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
}
