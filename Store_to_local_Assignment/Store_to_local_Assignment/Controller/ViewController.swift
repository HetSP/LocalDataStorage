//
//  ViewController.swift
//  Store_to_local_Assignment
//
//  Created by promact on 07/02/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onSignIn(_ sender: Any) {
        //Email & Password Validation
        if let email = txtEmail.text, let password = txtPassword.text {
            if email == "" && password == "" {
                UtilityFunctions().simpleAlert(vc: self, title: "Alert!", message: "Please Enter Email And Password")
            }else{
                if !email.isValidEmail(email: email){
                    UtilityFunctions().simpleAlert(vc: self, title: "Alert!", message: "Please Enter Valid Email")
                }else if !password.isValidPassword(password: password){
                    UtilityFunctions().simpleAlert(vc: self, title: "Alert!", message: "Please Enter Valid Password")
                }else{
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondScreen") as! SecondViewController
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
    }
    
}

extension String {
    // using RegEx
    
    // abc@gmail.com, hello@yahoo.com
    func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate (format: "SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate (with: email)
        return result
    }
    
    //Password length 6 to 16.
    //One Alphabet in Password.
    //One Special Character in Password.
    func isValidPassword(password: String) -> Bool {
        let passwordRegEx = "^(?=.*[a-z])(?=.*[$@$#!%*? &])[A-Za-z\\d$@$#!%*?&]{6,16}"
        let passwordTest = NSPredicate (format: "SELF MATCHES %@", passwordRegEx)
        let result = passwordTest.evaluate (with: password)
        return result
    }
}
