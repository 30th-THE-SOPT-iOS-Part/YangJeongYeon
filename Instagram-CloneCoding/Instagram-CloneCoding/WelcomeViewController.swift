//
//  WelcomeViewController.swift
//  Instagram-CloneCoding
//
//  Created by 정연 on 2022/04/10.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    var username: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUsername()
    }

    @IBAction func tapFinishBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func setUsername() {
        if let username = username {
            welcomeLabel.text = "\(username) 님 Instagram에\n오신 것을 환영합니다"
            welcomeLabel.sizeToFit()
        }
    }
}
