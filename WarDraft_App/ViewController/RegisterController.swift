import UIKit

class RegisterController: UIViewController {
    
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var showPasswordButton: UIButton!
    
    private var isPasswordVisible = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextField(fullNameTextField, placeholder: "Full Name")
        setupTextField(usernameTextField, placeholder: "Username")
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
    
    @IBAction func onNextButtonTap(_ sender: Any) {
        // Check if any of the text fields are empty
        guard let fullName = fullNameTextField.text, !fullName.isEmpty,
              let username = usernameTextField.text, !username.isEmpty,
              let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            showAlert(message: "All fields are required.")
            return
        }
        
        // Validate email format
        if !isValidEmail(email) {
            showAlert(message: "Please enter a valid email address.")
            return
        }
        
        // Validate password format
        if !isValidPassword(password) {
            showAlert(message: "Password must be at least 8 characters long, contain one uppercase letter, one number, and one special character.")
            return
        }
        
        // Call the register function if all validations pass
        register()
    }
    
    // Email validation regex
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}$"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    // Password validation regex
    private func isValidPassword(_ password: String) -> Bool {
        // At least 8 characters, 1 uppercase letter, 1 number, and 1 special character
        let passwordRegex = "^(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$&*]).{8,}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordPredicate.evaluate(with: password)
    }
    
    // Show an alert with the provided message
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    // Register function placeholder
    private func register() {
        // Add registration logic here
        print("Registration successful")
    }
}
