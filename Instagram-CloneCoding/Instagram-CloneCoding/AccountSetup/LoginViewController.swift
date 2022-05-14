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
    
    @IBAction func tapLoginBtn(_ sender: Any) {
        let welcomeStoryboard = UIStoryboard(name: "WelcomeViewController", bundle: nil)
        guard let welcomeViewController = welcomeStoryboard.instantiateViewController(withIdentifier: "WelcomeViewController") as? WelcomeViewController else { return }
        
        welcomeViewController.username = usernameTextField.text
        
        self.present(welcomeViewController, animated: true, completion: nil)
    }
    
    /*
     [?] 왜 기존에는 firstSigupViewController를 FirstSignupViewController로 가져오지 않아도 괜찮았는데
         firstSignupStoryboard에서 가져올때는 타입캐스팅을 해야할까
     @IBAction func tapSignupBtn(_ sender: Any) {
         guard let firstSigupViewController = self.storyboard?.instantiateViewController(withIdentifier: "FirstSignupViewController") else { return }
         self.navigationController?.pushViewController(firstSigupViewController, animated: true)
     }
     */
    @IBAction func tapSignupBtn(_ sender: Any) {
        let firstSignupStoryboard = UIStoryboard(name: "FirstSignupViewController", bundle: nil)
        guard let firstSigupViewController = firstSignupStoryboard.instantiateViewController(withIdentifier: "FirstSignupViewController") as? FirstSignupViewController else { return }
        self.navigationController?.pushViewController(firstSigupViewController, animated: true)
    }
}
