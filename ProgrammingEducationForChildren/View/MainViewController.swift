//
//  ViewController.swift
//  ProgrammingEducationForChildren
//
//  Created by Masato TSUTSUMI on 2019/12/09.
//  Copyright © 2019 Masato TSUTSUMI. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var unchi: UIButton!
    @IBOutlet weak var alien: UIButton!
    @IBOutlet weak var dog: UIButton!
    
    let passwords: [String] = ["0000", "1111", "2222"]
    
    var vc = PasswordViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCard(button: unchi, color: .systemRed)
        setCard(button: alien, color: .systemBlue)
        setCard(button: dog, color: .systemGreen)
        
    }
    
    @IBAction func unchiTapped(_ sender: Any) {
        performSegue(withIdentifier: "toPassword", sender: passwords[0])
    }
    @IBAction func alienTapped(_ sender: Any) {
        performSegue(withIdentifier: "toPassword", sender: passwords[1])
    }
    @IBAction func dogTapped(_ sender: Any) {
        performSegue(withIdentifier: "toPassword", sender: passwords[2])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPassword" {
            let secondViewController = segue.destination as! PasswordViewController
            secondViewController.password = sender as! String
        }
    }
    
    func setCard(button: UIButton, color: UIColor) {
        button.layer.cornerRadius = 20
        button.backgroundColor = color
        button.tintColor = .white
    }
   
}

