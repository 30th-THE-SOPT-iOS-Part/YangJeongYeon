//
//  CodeTabBarController.swift
//  SOPT30th-2nd-Seminar
//
//  Created by 정연 on 2022/04/09.
//

import UIKit

class CodeTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setTabBarController()
    }
    
    // 함수 작성 - 탭 바 컨트롤러 세팅
    
    // 1. 스토리보드 상에 있는 뷰 컨트롤러를 안전하게 가져와서 인스턴스화
    // - 사용할 화면, 연결할 화면 가져왔음!
    func setTabBarController() {
        guard let firstViewController = self.storyboard?.instantiateViewController(withIdentifier: "FirstViewController"),
            let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController")
        else { return }
        
        // 2. 탭바 아이템 설정
        firstViewController.tabBarItem = UITabBarItem(
            title: "First Tab",
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill")
        )
        
        secondViewController.tabBarItem = UITabBarItem(
            title: "First Tab",
            image: UIImage(named: "Image"),
            selectedImage: UIImage(named: "Image-1")
        )
        
        // 3. 연결 (화면 - 탭바 컨트롤러)
        setViewControllers([firstViewController, secondViewController], animated: true)
    }
  
   

}
