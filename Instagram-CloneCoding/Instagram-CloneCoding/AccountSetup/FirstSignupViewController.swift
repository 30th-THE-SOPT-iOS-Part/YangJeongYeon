//
//  FirstSignupViewController.swift
//  Instagram-CloneCoding
//
//  Created by 정연 on 2022/04/10.
//

import UIKit

class FirstSignupViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    // MARK: - UI
    private func configureUI(){
        nextBtn.isEnabled = false
        usernameTextField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.topItem?.title = ""
    }
    
    @objc func editingChanged(_ textField: UITextField) {
        nextBtn.isEnabled = !(usernameTextField.text?.isEmpty ?? true)
    }
    
    @IBAction func tapNextBtn(_ sender: Any) {
        let secondSignupStoryboard = UIStoryboard(name: "SecondSignupViewController", bundle: nil)
        guard let secondSigupViewController = secondSignupStoryboard.instantiateViewController(withIdentifier: "SecondSignupViewController") as? SecondSignupViewController else { return }
        
        secondSigupViewController.username = usernameTextField.text
        
        self.navigationController?.pushViewController(secondSigupViewController, animated: true)
    }
    
}
