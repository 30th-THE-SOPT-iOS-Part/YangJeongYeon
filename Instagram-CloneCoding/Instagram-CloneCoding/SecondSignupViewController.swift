//
//  SecondSignupViewController.swift
//  Instagram-CloneCoding
//
//  Created by 정연 on 2022/04/10.
//

import UIKit

class SecondSignupViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }    

    @IBAction func tapNextBtn(_ sender: Any) {
        guard let welcomeViewController = self.storyboard?.instantiateViewController(withIdentifier: "WelcomeViewController") as? WelcomeViewController else { return }
        
        self.present(welcomeViewController, animated: true, completion: nil)
    }
    
}
