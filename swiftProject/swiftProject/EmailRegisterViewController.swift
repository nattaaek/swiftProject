//
//  EmailRegisterViewController.swift
//  swiftProject
//
//  Created by Alzack Connell on 11/17/2560 BE.
//  Copyright © 2560 Alzack Connell. All rights reserved.
//

import UIKit

class EmailRegisterViewController: UIViewController {


    @IBOutlet weak var userPhone: UITextField!
    @IBOutlet weak var userEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func loginAction(_ sender: Any) {
        let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "login") as! LoginViewController
        self.present(nextViewController, animated: true, completion: nil)
    }
    @IBAction func nextStep(_ sender: Any) {
        let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "email_register2") as! EmailRegister2ViewController
        if userEmail.text == "" || userPhone.text == ""{
            let alert = UIAlertController(title: "Error", message: "Please insert your email and phone number please!", preferredStyle: UIAlertControllerStyle.alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(action)
            
            self.present(alert, animated: true, completion: nil)
            
        }
        else{
            nextViewController.inputEmail = userEmail.text!
            nextViewController.inputPhone = userPhone.text!
            self.present(nextViewController, animated: true, completion: nil)
        }
   
    }
}
