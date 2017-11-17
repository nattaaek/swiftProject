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

    var inputEmail = ""
    var inputPhone = ""
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
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginAction(_ sender: Any) {
        let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "login") as! LoginViewController
        self.present(nextViewController, animated: true, completion: nil)
    }
    @IBAction func signupAction(_ sender: Any) {
        if  inputPassword.text! == "" || inputConfirmPassword.text! == "" && inputPassword.text! == inputConfirmPassword.text {
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
                    print("Successfully")
                    
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
