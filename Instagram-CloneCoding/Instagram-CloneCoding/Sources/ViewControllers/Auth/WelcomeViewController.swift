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
        let mainTabBarStoryboard = UIStoryboard(name: "MainTabBar", bundle: nil)
        let mainTabBar = mainTabBarStoryboard.instantiateViewController(withIdentifier: "MainTabBar") as! UITabBarController
        /*
         [?] 구글링해보니 AppDelegate 이용해서 바꾸는 방법도 있는데 window가 없다고 오류난다
         let appDelegate = UIApplication.shared.delegate as! AppDelegate
         appDelegate.window?.rootViewController = mainTabBar
         */
        self.view.window?.rootViewController = mainTabBar
    }
    
    /*
     [TODO] 이거 가입하기 하고 누르면 로그인 화면이 아니라 비밀번호 설정 화면으로 넘어간다.
     */
    @IBAction func tapOtherLoginBtn(_ sender: Any) {
        guard let presentViewController = presentingViewController as? UINavigationController else { return }
        dismiss(animated: true) {
            presentViewController.navigationController?.popToRootViewController(animated: true)
        }
    }
    
    private func setUsername() {
        if let username = username {
            welcomeLabel.text = "\(username) 님 Instagram에\n오신 것을 환영합니다"
            welcomeLabel.sizeToFit()
        }
    }
}