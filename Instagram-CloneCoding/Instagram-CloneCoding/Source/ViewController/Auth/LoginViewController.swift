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
        login()
    }
    
    @IBAction func tapSignupBtn(_ sender: Any) {
        let firstSignupStoryboard = UIStoryboard(name: "FirstSignupViewController", bundle: nil)
        guard let firstSigupViewController = firstSignupStoryboard.instantiateViewController(withIdentifier: "FirstSignupViewController") as? FirstSignupViewController else { return }
        self.navigationController?.pushViewController(firstSigupViewController, animated: true)
    }
    
    // MARK: - Custom Methods
    /// 로그인 성공시에 alert 띄우는 메서드
    private func successAlert(name: String)
    {
        let alert = UIAlertController(title: "로그인 성공", message: "\(name)님 환영합니다!", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "확인", style: .default) { _ in
            let mainTabBarStoryboard = UIStoryboard(name: "MainTabBar", bundle: nil)
            let mainTabBar = mainTabBarStoryboard.instantiateViewController(withIdentifier: "MainTabBar") as! UITabBarController
            self.view.window?.rootViewController = mainTabBar
        }
        alert.addAction(alertAction)
        present(alert, animated: true)
    }
    /// 로그인 실패시에 alert 띄우는 메서드
    private func failAlert(errCode: String)
    {
        let alert = UIAlertController(title: "로그인 실패", message: "다시 시도해보세요\n\(errCode)", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(alertAction)
        present(alert, animated: true)
    }
}

extension LoginViewController {
    func login() {
        guard let name = usernameTextField.text else { return }
        let email = "jeong@gmail.com"
        guard let password = passwordTextField.text else { return }
        
        UserService.shared.login(name: name, email: email, password: password) { response in
            switch response {
            case .success(let data):
                guard let data = data as? LoginData else { return }
                self.successAlert(name: data.name)
            case .requestErr(_):
                self.failAlert(errCode: "Request Error")
            case .pathErr:
                self.failAlert(errCode: "Path Error")
            case .serverErr:
                self.failAlert(errCode: "Server Error")
            case .networkFail:
                self.failAlert(errCode: "Network Fail Error")
            default:
                self.failAlert(errCode: "Error")
            }
        }
    }
}
