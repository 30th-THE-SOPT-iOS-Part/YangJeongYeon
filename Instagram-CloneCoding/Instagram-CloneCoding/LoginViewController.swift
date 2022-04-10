//
//  LoginViewController.swift
//  Instagram-CloneCoding
//
//  Created by 정연 on 2022/04/10.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginBtn.isEnabled = false

        [usernameTextField, passwordTextField].forEach({ $0?.addTarget(self, action: #selector(editingChanged), for: .editingChanged) })
    }
    
    @objc func editingChanged(_ textField: UITextField) {
        loginBtn.isEnabled = ![usernameTextField, passwordTextField].compactMap {
                $0.text?.isEmpty
            }.contains(true)
    }
    
    @IBAction func tapLoginBtn(_ sender: Any) {
        guard let welcomeViewController = self.storyboard?.instantiateViewController(withIdentifier: "WelcomeViewController") as? WelcomeViewController else { return }
        
        welcomeViewController.username = usernameTextField.text
        
        self.present(welcomeViewController, animated: true, completion: nil)
    }
    
    @IBAction func tapSignupBtn(_ sender: Any) {
        guard let firstSigupViewController = self.storyboard?.instantiateViewController(withIdentifier: "FirstSignupViewController") else { return }
        self.navigationController?.pushViewController(firstSigupViewController, animated: true)
    }
}
