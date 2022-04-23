//
//  DelegatePracticeViewController.swift
//  3rd-Seminar
//
//  Created by 정연 on 2022/04/23.
//

import UIKit

class DelegatePracticeViewController: UIViewController, SecondViewControllerDelegate {
    
    func sendData(data: String) {
        dataLabel.text = data
    }
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var dataLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textField.delegate = self
    }
    
    @IBAction func tapNextBtn(_ sender: Any) {
        guard let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else { return }
        
        secondViewController.delegate = self
        
        self.navigationController?.pushViewController(secondViewController, animated: true)
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
