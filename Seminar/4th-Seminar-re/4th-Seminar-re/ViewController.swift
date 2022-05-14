//
//  ViewController.swift
//  4th-Seminar-re
//
//  Created by 정연 on 2022/05/12.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapLoginBtn(_ sender: Any) {
        login()
    }
    

}

extension ViewController {
    func login() {
        guard let name = nameTextField.text else { return }
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        UserService.shared.login(
            name: name,
            email: email,
            password: password) { response in
            switch response {
            case .success(let data):
//                print("이게 진짜 성공")
                print(data)
                guard let data = data as? LoginData else { return }
                print(data)
                self.alert(message: "\(data.name)님 환영합니다!")
            case .requestErr(let err):
                print(err)
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
    
    func alert(message: String) {
       let alertVC = UIAlertController(title: message, message: nil, preferredStyle: .alert)
       let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
       alertVC.addAction(okAction)
       present(alertVC, animated: true)
   }
}
