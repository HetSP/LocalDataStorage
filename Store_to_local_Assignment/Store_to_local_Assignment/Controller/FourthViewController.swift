//
//  FourthViewController.swift
//  Store_to_local_Assignment
//
//  Created by promact on 15/02/24.
//

import UIKit

class FourthViewController: UIViewController {

    @IBOutlet weak var lblOccupation: UILabel!
    @IBOutlet weak var lblPhoneNumber: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblAge: UILabel!
    @IBOutlet weak var lblName: UILabel!
    var user = UserModel(id: "", name: "", age: "", email: "", address: "", phone: "", occupation: "")
    override func viewDidLoad() {
        super.viewDidLoad()
        user = ModelManager.getInstance().getUser()
        lblName.text = "Name: \(user.name)"
        lblAge.text = "Age: \(user.age)"
        lblEmail.text = "Email: \(user.email)"
        lblAddress.text = "Address: \(user.address)"
        lblPhoneNumber.text = "Phone: \(user.phone)"
        lblOccupation.text = "Occupation: \(user.occupation)"
        // Do any additional setup after loading the view.
    }
}
