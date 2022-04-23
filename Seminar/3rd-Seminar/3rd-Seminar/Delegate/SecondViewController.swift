//
//  SecondViewController.swift
//  3rd-Seminar
//
//  Created by 정연 on 2022/04/23.
//

import UIKit

// [?] 이건 원래 데이터를 second view controller가 해줘야 하는건가?? 여기다 프로토콜 선언??해주는 이유가 뭐지? *그냥??* -> 새로 파일 만들어서 얘만 넣어도 된다~
protocol SecondViewControllerDelegate {
    func sendData(data: String)
}

class SecondViewController: UIViewController {
    
    @IBOutlet weak var dataTextField: UITextField!
    
    // [?] 이거 왜 옵셔널이지
    var delegate: SecondViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func tapSendDataBtn(_ sender: Any) {
        if let text = dataTextField.text {
            delegate?.sendData(data: text)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
}
