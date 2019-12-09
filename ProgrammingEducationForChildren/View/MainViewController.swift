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
    @IBOutlet weak var cardStackView: UIStackView!
    
    let passwords: [String] = ["0000", "1111", "2222"]
    
    var vc = PasswordViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCard(button: unchi, color: .systemRed)
        setCard(button: alien, color: .systemBlue)
        setCard(button: dog, color: .systemGreen)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if self.view.bounds.width < self.view.bounds.height {
            cardStackView.axis = .vertical
        } else {
            cardStackView.axis = .horizontal
        }
        
        let action = #selector(orientationDidChange(_:))
        let center = NotificationCenter.default
        let name = UIDevice.orientationDidChangeNotification
        center.addObserver(self, selector: action, name: name, object: nil)
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
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        let center = NotificationCenter.default
        let name = UIDevice.orientationDidChangeNotification
        center.removeObserver(self, name: name, object: nil)
    }

    @objc func orientationDidChange(_ notification: NSNotification) {
        // 端末の向きを判定します。
        // 縦向きを検知する場合、
        //   device.orientation.isPortrait
        // を判定します。
        let device = UIDevice.current
        if device.orientation.isLandscape {
            // 横向きの場合
            cardStackView.axis = .horizontal

        } else {
            // 縦向きの場合
            cardStackView.axis = .vertical
        }
    }
    
    
}

