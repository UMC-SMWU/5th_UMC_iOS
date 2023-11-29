//
//  LoginViewController.swift
//  CatStaGram
//
//  Created by 김세아 on 2023/09/19.
//

import UIKit

class LoginViewController: UIViewController {
    
    var email = String()
    var password = String()
    var userInfo: UserInfo?

    
    @IBOutlet weak var registerButton: UIButton!
    
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAttribute()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func emailTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? "" //값이 없을 경우엔 ?? 우측의 값을 기본값으로 하겠다.
        self.loginButton.backgroundColor = text.isValidEmail() ? .facebook : .disabledButton
        self.email = text
    }
    
    @IBAction func passwordTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        self.loginButton.backgroundColor = text.count > 2 ? .facebook : .disabledButton
        self.password = text
    }
    
    @IBAction func loginButtonDidTap(_ sender: UIButton) {
        // 회원가입 정보를 전달받아 그것과 textField 데이터가 일치하면 로그인하도록 함
        guard let userInfo = self.userInfo else { return }
        
        if userInfo.email == self.email
            && userInfo.password == self.password {
            //화면 전환. withIdentifier에는 ID를, as 뒤에는 뷰 컨트롤러의 이름을 적음
            let vc = storyboard?.instantiateViewController(withIdentifier: "TabBarVC") as! UITabBarController
            
            self.view.window?.windowScene?.keyWindow?.rootViewController = vc
            // vc.modalPresentationStyle = .fullScreen //꽉 찬 화면으로 전달
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    @IBAction func registerButtonDidTap(_ sender: UIButton) {
        //화면 전환
        //1. 스토리보드 생성
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        //2. 뷰 컨트롤러 생성
        
        let registerViewController = storyboard.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterViewController
        
        //3. 화면 전환 메소드를 이용해 화면 전환
        //self.present(registerViewController, animated: true, completion: nil)
        self.navigationController?.pushViewController(registerViewController, animated: true)
        
        // ARC -> 강한 참조. 메모리에 계속 남아있어서 낭비될 수 있음
        // weak self -> 약한 참조. ARC 낮춰줌. 메모리에 남아있지 않음
        registerViewController.userInfo = { [weak self] (userInfo) in
            self?.userInfo = userInfo
        }
    }

    
    private func setupAttribute() {
        //registerButton
        
        let text1 = "계정이 없으신가요?"
        let text2 = "가입하기"
        
        let font1 = UIFont.systemFont(ofSize: 13)
        let font2 = UIFont.boldSystemFont(ofSize: 13)
        
        let color1 = UIColor.darkGray
        let color2 = UIColor.facebook
        
        let attributes = generateButtonAttribute(self.registerButton, texts: text1, text2, fonts: font1, font2, colors: color1, color2)
        
        self.registerButton.setAttributedTitle(attributes, for: .normal)
    }
}
