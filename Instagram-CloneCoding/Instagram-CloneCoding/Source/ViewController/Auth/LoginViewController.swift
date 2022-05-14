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
    /// 로그인 성공시 alert 띄우는 메서드
    private func alertUser(title: String, message: String, isSuccess: Bool)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        // TODO: Result 타입이라는게 있던데 이걸로 처리하면 더 깔끔하지 않을까??
        if isSuccess {
            let alertAction = UIAlertAction(title: "확인", style: .default) { _ in
                let mainTabBarStoryboard = UIStoryboard(name: "MainTabBar", bundle: nil)
                let mainTabBar = mainTabBarStoryboard.instantiateViewController(withIdentifier: "MainTabBar") as! UITabBarController
                self.view.window?.rootViewController = mainTabBar
            }
            alert.addAction(alertAction)
        }
        else {
            let alertAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            alert.addAction(alertAction)
        }
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
                self.alertUser(title: "로그인 성공", message: "\(data.name)님 환영합니다!", isSuccess: true)
            // 여기 뭔가 비효율적인 것 같은데 message의 에러코드만 전달하는 방법 뭐 없나??
            // 성공/실패에 따른 alert 함수 자체를 따로 두는게 좋으려나?
            case .requestErr(_):
                self.alertUser(title: "로그인 실패", message: "다시 시도해보세요\nRequest Error", isSuccess: false)
            case .pathErr:
                self.alertUser(title: "로그인 실패", message: "다시 시도해보세요\nPath Error", isSuccess: false)
            case .serverErr:
                self.alertUser(title: "로그인 실패", message: "다시 시도해보세요\nServer Error", isSuccess: false)
            case .networkFail:
                self.alertUser(title: "로그인 실패", message: "다시 시도해보세요\nNetwork Fail Error", isSuccess: false)
            default:
                self.alertUser(title: "로그인 실패", message: "다시 시도해보세요\nError", isSuccess: false)
            }
        }
    }
}
