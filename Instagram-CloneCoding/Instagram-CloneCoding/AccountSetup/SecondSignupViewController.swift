//
//  SecondSignupViewController.swift
//  Instagram-CloneCoding
//
//  Created by 정연 on 2022/04/10.
//

import UIKit

class SecondSignupViewController: UIViewController {
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nextBtn: UIButton!
    var username: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextBtn.isEnabled = false
        
        passwordTextField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
    }    

    @objc func editingChanged(_ textField: UITextField) {
        nextBtn.isEnabled = !(passwordTextField.text?.isEmpty ?? true)
    }
    
    @IBAction func tapNextBtn(_ sender: Any) {
        let welcomeStoryboard = UIStoryboard(name: "WelcomeViewController", bundle: nil)
        guard let welcomeViewController = welcomeStoryboard.instantiateViewController(withIdentifier: "WelcomeViewController") as? WelcomeViewController else { return }
        
        welcomeViewController.username = username
        
        self.present(welcomeViewController, animated: true, completion: nil)
    }
    
}
