//
//  LoginViewController.swift
//  WarDraft_App
//
//  Created by Jad Rammal on 13/09/2024.
//

import UIKit

class LoginController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var showPasswordButton: UIButton!
    
    private var isPasswordVisible = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTextField(emailTextField, placeholder: "Email")
        setupTextField(passwordTextField, placeholder: "Password", isSecure: true)
        
        navigationController?.navigationBar.tintColor = .white
    }
    
    private func setupTextField(_ textField: UITextField, placeholder: String, isSecure: Bool = false) {
        textField.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = isSecure
    }
    
    @IBAction func onShowPasswordButtonTap(_ sender: Any) {
        isPasswordVisible.toggle()
        passwordTextField.isSecureTextEntry = !isPasswordVisible

        if let button = showPasswordButton {
            let iconName = isPasswordVisible ? "eye.slash" : "eye.fill"
            button.setImage(UIImage(systemName: iconName), for: .normal)
        }
    }
    
    @IBAction func onLoginButtonTap(_ sender: Any) {
        
    }
    
}
