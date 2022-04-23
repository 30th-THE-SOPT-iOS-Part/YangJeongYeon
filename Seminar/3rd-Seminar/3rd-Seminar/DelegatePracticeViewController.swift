//
//  DelegatePracticeViewController.swift
//  3rd-Seminar
//
//  Created by 정연 on 2022/04/23.
//

import UIKit

class DelegatePracticeViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textField.delegate = self
    }
}

extension DelegatePracticeViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("텍스트필드 편집 시작!!")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Return 버튼이 눌렸어요!!")
        textField.endEditing(true)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("텍스트필드 편집 끝!!")
    }
}
