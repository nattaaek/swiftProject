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
