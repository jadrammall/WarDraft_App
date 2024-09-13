//
//  ViewController.swift
//  WarDraft_App
//
//  Created by Jad Rammal on 13/09/2024.
//

import UIKit

class OnBoardingController: UIViewController {
    
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onRegisterButtonTap(_ sender: Any) {
        pushController(withIdentifier: "RegisterController")    }
    
    @IBAction func onLoginButtonTap(_ sender: Any) {
        pushController(withIdentifier: "LoginController")
    }
    
    func pushController(withIdentifier identifier: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let destination = storyboard.instantiateViewController(withIdentifier: identifier) as? UIViewController else {
            print("ViewController with identifier \(identifier) not found.")
            return
        }
        navigationController?.pushViewController(destination, animated: true)
    }
    
}

