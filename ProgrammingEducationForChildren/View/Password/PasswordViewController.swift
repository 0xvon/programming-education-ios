//
//  PasswordViewController.swift
//  ProgrammingEducationForChildren
//
//  Created by Masato TSUTSUMI on 2019/12/09.
//  Copyright © 2019 Masato TSUTSUMI. All rights reserved.
//

import Foundation
import UIKit

class PasswordViewController: UIViewController {
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var visibleButton: UIButton!
    
    var password: String = ""
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordTextField.textContentType = .password
        passwordTextField.isSecureTextEntry = true
        
        setButton(button: submitButton, color: .systemGreen)
    }
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        
        guard let password = passwordTextField.text else {
            print("password not input")
            return
        }
        
        if password == self.password {
            switch password {
            case "0000":
                performSegue(withIdentifier: "toUnchi", sender: nil)
            case "1111":
                performSegue(withIdentifier: "toAlien", sender: nil)
            case "2222":
                performSegue(withIdentifier: "toDog", sender: nil)
            default:
                return
            }
        } else {
            let alert: UIAlertController = UIAlertController(title: "パスワードがまちがっているよ", message: "", preferredStyle:  UIAlertController.Style.alert)

            let defaultAction: UIAlertAction = UIAlertAction(title: "やりなおす", style: UIAlertAction.Style.default, handler:{
                (action: UIAlertAction!) -> Void in
            })
            
            alert.addAction(defaultAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func visibleButtonTapped(_ sender: Any) {
        passwordTextField.isSecureTextEntry.toggle()
        
        if passwordTextField.isSecureTextEntry {
            visibleButton.setImage(UIImage(systemName: "eye"), for: .normal)
        } else {
            visibleButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        }
    }
    
    func setButton(button: UIButton, color: UIColor) {
        button.layer.cornerRadius = button.bounds.height / 2
        button.tintColor = .white
        button.backgroundColor = color
    }
}
