//
//  LoginViewController.swift
//  Instagram-CloneCoding
//
//  Created by 정연 on 2022/04/10.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - @IBOutlet
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    // MARK: - UI
    private func configureUI(){
        loginBtn.isEnabled = false

        [usernameTextField, passwordTextField].forEach({ $0?.addTarget(self, action: #selector(editingChanged), for: .editingChanged) })
    }
    
    @objc func editingChanged(_ textField: UITextField) {
        loginBtn.isEnabled = ![usernameTextField, passwordTextField].compactMap {
                $0.text?.isEmpty
            }.contains(true)
    }
    
    // MARK: - @IBAction
    @IBAction func tapLoginBtn(_ sender: Any) {
        func login() {
            guard let name = usernameTextField.text else { return }
            let email = "jeong@gmail.com"
            guard let password = passwordTextField.text else { return }
            
            UserService.shared.login(name: name, email: email, password: password) { response in
                switch response {
                case .success(let data):
                    guard let data = data as? LoginData else { return }
                    print("성공!! \(data.name)님 환영합니다!")
                default:
                    print("실패..")
                }
            }
        }
        let welcomeStoryboard = UIStoryboard(name: "WelcomeViewController", bundle: nil)
        guard let welcomeViewController = welcomeStoryboard.instantiateViewController(withIdentifier: "WelcomeViewController") as? WelcomeViewController else { return }
        
        welcomeViewController.username = usernameTextField.text
        
        self.present(welcomeViewController, animated: true, completion: nil)
    }
    
    @IBAction func tapSignupBtn(_ sender: Any) {
        let firstSignupStoryboard = UIStoryboard(name: "FirstSignupViewController", bundle: nil)
        guard let firstSigupViewController = firstSignupStoryboard.instantiateViewController(withIdentifier: "FirstSignupViewController") as? FirstSignupViewController else { return }
        self.navigationController?.pushViewController(firstSigupViewController, animated: true)
    }
}
