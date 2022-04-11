//
//  FirstViewController.swift
//  SOPT30th-1st-Seminar
//
//  Created by 정연 on 2022/04/02.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBOutlet weak var dataTextField: UITextField!
    
    @IBAction func goToSecondViewController(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else {return}
        // 타입캐스팅
        nextVC.message = dataTextField.text
        
//        self.present(nextVC, animated: true, completion: nil)
            // 네비게이션 Push (오른쪽으로 이동)
        self.navigationController?.pushViewController(nextVC, animated: true)
    }

}
