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
    

    var handle: AuthStateDidChangeListenerHandle?
    override func viewDidLoad() {
        super.viewDidLoad()
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

