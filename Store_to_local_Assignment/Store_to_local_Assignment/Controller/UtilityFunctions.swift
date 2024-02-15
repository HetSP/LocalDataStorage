//
//  UtilityFunctions.swift
//  Store_to_local_Assignment
//
//  Created by promact on 08/02/24.
//

import UIKit

class UtilityFunctions: NSObject {
    func simpleAlert(vc: UIViewController, title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "  Ok", style: .default, handler: nil)
        alert.addAction(okAction)
        vc.present(alert, animated: true, completion: nil)
    }
}
