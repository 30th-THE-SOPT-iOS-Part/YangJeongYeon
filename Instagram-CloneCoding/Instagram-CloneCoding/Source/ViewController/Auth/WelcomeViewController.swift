//
//  WelcomeViewController.swift
//  Instagram-CloneCoding
//
//  Created by 정연 on 2022/04/10.
//
import UIKit

class WelcomeViewController: UIViewController {

    // MARK: @IBOutlet
    @IBOutlet weak var welcomeLabel: UILabel!
    var username: String?
    var password: String?
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUsername()
    }

    // MARK: @IBAction
    @IBAction func tapFinishBtn(_ sender: Any) {
        signup()
    }
    
    @IBAction func tapOtherLoginBtn(_ sender: Any) {
        guard let presentingViewController = self.presentingViewController as? UINavigationController else { return }
        self.view.window?.rootViewController?.dismiss(animated: false){
            presentingViewController.popToRootViewController(animated: true)}
    }
    
    // MARK: Custom Methods
    /// 회원가입 성공시에 alert 띄우는 메서드
    private func successAlert(name: String)
    {
        let alert = UIAlertController(title: "회원가입 성공", message: "\(name)님 환영합니다!", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "확인", style: .default) { _ in
            guard let presentingViewController = self.presentingViewController as? UINavigationController else { return }
            self.view.window?.rootViewController?.dismiss(animated: false){
                presentingViewController.popToRootViewController(animated: true)}
        }
        alert.addAction(alertAction)
        present(alert, animated: true)
    }
    /// 회원가입 실패시에 alert 띄우는 메서드
    private func failAlert(errCode: String)
    {
        let alert = UIAlertController(title: "회원가입 실패", message: "다시 시도해보세요\n\(errCode)", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(alertAction)
        present(alert, animated: true)
    }
    
    /// View에 username 값을 채워넣는 메서드
    private func setUsername() {
        if let username = username {
            welcomeLabel.text = "\(username) 님 Instagram에\n오신 것을 환영합니다"
            welcomeLabel.sizeToFit()
        }
    }
}

extension WelcomeViewController {
    func signup() {
        guard let name = username, let password = password else { return }
        let email = name + "@gmail.com"
        
        UserService.shared.signup(name: name, email: email, password: password) { response in
            switch response {
            case .success(_):
                self.successAlert(name: name)
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
