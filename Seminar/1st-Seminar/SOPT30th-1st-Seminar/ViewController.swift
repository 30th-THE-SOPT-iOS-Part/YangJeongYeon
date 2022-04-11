//
//  ViewController.swift
//  SOPT30th-1st-Seminar
//
//  Created by 정연 on 2022/04/02.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.text = "도착한 메세지가 없어요!"
        messageLabel.sizeToFit()
        // Do any additional setup after loading the view.
    }

    @IBAction func doneButtonDidTap(_ sender: Any) {
        messageLabel.text = "새로운 메세지가 도착했어요~"
        messageLabel.textColor = .cyan
        messageLabel.sizeToFit()
        AudioServicesPlayAlertSound(SystemSoundID(1307))
    }
    
}

