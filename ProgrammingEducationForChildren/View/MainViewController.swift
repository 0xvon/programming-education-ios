//
//  ViewController.swift
//  ProgrammingEducationForChildren
//
//  Created by Masato TSUTSUMI on 2019/12/09.
//  Copyright © 2019 Masato TSUTSUMI. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var visibleButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        textField.textContentType = .password
        textField.isSecureTextEntry = true
        
    }

    @IBAction func buttonTapped(_ sender: Any) {
        guard let password = textField.text else {
            print("password not input")
            return
        }
        if password == "hello" {
            performSegue(withIdentifier: "toTop", sender: nil)
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
        textField.isSecureTextEntry.toggle()
        
        if textField.isSecureTextEntry {
            visibleButton.setImage(UIImage(systemName: "eye"), for: .normal)
        } else {
            visibleButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        }
    }
    
    
}

