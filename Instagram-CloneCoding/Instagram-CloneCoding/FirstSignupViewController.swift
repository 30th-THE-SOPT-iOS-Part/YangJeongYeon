//
//  FirstSignupViewController.swift
//  Instagram-CloneCoding
//
//  Created by 정연 on 2022/04/10.
//

import UIKit

class FirstSignupViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    @IBAction func tapNextBtn(_ sender: Any) {
        guard let secondSigupViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondSignupViewController") else { return }
        self.navigationController?.pushViewController(secondSigupViewController, animated: true)
    }
    
}
