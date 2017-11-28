//
//  EmailRegisterViewController.swift
//  swiftProject
//
//  Created by Alzack Connell on 11/17/2560 BE.
//  Copyright © 2560 Alzack Connell. All rights reserved.
//

import UIKit

class EmailRegisterViewController: UIViewController {


    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var line: UILabel!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var userPhone: UITextField!
    @IBOutlet weak var userEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Button Area
        let gradient = CAGradientLayer()
        let colorTop = UIColor(red: 67/255, green: 206/255, blue: 162/255, alpha: 1).cgColor
        let colorBottom = UIColor(red: 24/255, green: 90/255, blue: 157/255, alpha: 1).cgColor
        
        gradient.colors = [colorTop, colorBottom]
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        gradient.frame = btnNext.bounds
        gradient.cornerRadius = gradient.frame.height/2
        
        let myGraident = UIImage(named: "textgradient.png")
        line.textColor = UIColor(patternImage: myGraident!)
        
        btnNext.layer.cornerRadius = btnNext.frame.height/2
        btnNext.clipsToBounds = true
        btnNext.layer.shouldRasterize = true
        btnNext.layer.rasterizationScale = UIScreen.main.scale
        btnNext.layer.borderWidth = 3
        btnNext.layer.borderColor = UIColor(red: 205/255, green: 219/255, blue: 232/255, alpha: 1).cgColor
        btnNext.layer.addSublayer(gradient)
        
        
        //textBox Area
        
        
        txtEmail.layer.cornerRadius = 15
        txtEmail.layer.borderWidth = 1
        txtEmail.layer.borderColor = UIColor(red: 211/255, green: 225/255, blue: 236/255, alpha: 1).cgColor
        txtEmail.backgroundColor = UIColor(patternImage: UIImage(named: "txtGradient.png")!)
        
        
        txtPhone.layer.cornerRadius = 15
        txtPhone.layer.borderWidth = 1
        txtPhone.layer.borderColor = UIColor(red: 211/255, green: 225/255, blue: 236/255, alpha: 1).cgColor
        txtPhone.backgroundColor = UIColor(patternImage: UIImage(named: "txtGradient.png")!)
        
        
        // Background Area
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "bg7.png")?.draw(in: self.view.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)

        // Do any additional setup after loading the view.
    }
    

    @IBAction func loginAction(_ sender: Any) {
        let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "login") as! LoginViewController
        self.present(nextViewController, animated: true, completion: nil)
    }
    @IBAction func nextStep(_ sender: Any) {
        let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "email_register2") as! EmailRegister2ViewController
        // user input email = " " or phone = " "
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
