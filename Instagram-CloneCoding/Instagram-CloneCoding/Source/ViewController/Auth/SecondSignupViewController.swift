//
//  SecondSignupViewController.swift
//  Instagram-CloneCoding
//
//  Created by 정연 on 2022/04/10.
//

import UIKit

class SecondSignupViewController: UIViewController {
    
    // MARK: @IBOutlet
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nextBtn: UIButton!
    var username: String?

    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: UI
    private func configureUI(){
        nextBtn.isEnabled = false
        passwordTextField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.topItem?.title = ""
    }

    // MARK: Custom Methods
    @objc func editingChanged(_ textField: UITextField) {
        nextBtn.isEnabled = !(passwordTextField.text?.isEmpty ?? true)
    }
    
    // MARK: @IBAction
    @IBAction func tapNextBtn(_ sender: Any) {
        let welcomeStoryboard = UIStoryboard(name: "WelcomeViewController", bundle: nil)
        guard let welcomeViewController = welcomeStoryboard.instantiateViewController(withIdentifier: "WelcomeViewController") as? WelcomeViewController else { return }
        
        welcomeViewController.username = username
        welcomeViewController.password = passwordTextField.text
        
        self.present(welcomeViewController, animated: true, completion: nil)
    }
    
}
