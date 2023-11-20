//
//  ViewController.swift
//  UserDefaults
//
//  Created by 김세아 on 11/18/23.
//
import UIKit
import FirebaseAuth
import FirebaseCore

class ViewController: UIViewController {
    @IBOutlet weak var signupButton: UIButton!
    
    var email: String = ""
    var password: String = ""
    
    var isValidEmail = false {
        didSet {
            self.validateUserInfo()
        }
    }
    
    var isValidPassword = false {
        didSet {
            self.validateUserInfo()
        }
    }
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    var textFields: [UITextField] {
        [emailTextField, passwordTextField]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signupButton.layer.cornerRadius = 4
        setupTextField()
    }
    
    
    @objc
    func textFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        
        switch sender {
        case emailTextField:
            self.isValidEmail = text.isValidEmail()
            self.email = text
            
        case passwordTextField:
            self.isValidPassword = text.isValidPassword()
            self.password = text
            
        default:
            fatalError("Missing TextField...")
        }
    }
    
    //회원가입하기 버튼을 눌렀을 때
    @IBAction func registerButtonDidtap(_ sender: UIButton) {
        createUser()
        //let loginViewController = storyboard?.instantiateViewController(withIdentifier: "LogInView") as! LogInViewController
        //self.navigationController?.pushViewController(loginViewController, animated: true)
    }
    
    
    private func setupTextField() {
        textFields.forEach{ tf in
            tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        }
        
    }
    
    //유효성 검증 및 회원가입하기 버튼 UI 변경
    private func validateUserInfo() {
        if isValidEmail && isValidPassword {
            UIView.animate(withDuration: 0.33) {
                self.signupButton.isEnabled = true
                self.signupButton.backgroundColor = UIColor.systemIndigo
            }
        } else {
            self.signupButton.isEnabled = false
        }
    }
    
    //Firebase를 이용한 유저 등록
    fileprivate func createUser() {
            guard let email = emailTextField.text else { return }
            guard let pw = passwordTextField.text else { return }
            
            Auth.auth().createUser(withEmail: email, password: pw) {result,error in
                if let error = error {
                    print(error)
                }
                
                if let result = result {
                    print(result)
                }
            }
        }
    


    fileprivate func signOut() {
            let firebaseAuth = Auth.auth()
            do {
                try firebaseAuth.signOut()
            } catch let signOutError as NSError {
                print("Error signing out: %@", signOutError)
            }
        }
    
}

extension String {
    // 대문자, 소문자, 특수문자, 숫자 8자 이상일 때 -> True
    func isValidPassword() -> Bool {
        let regularExpression = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}"
        let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regularExpression)
        
        return passwordValidation.evaluate(with: self)
    }
    
    // @ 포함하고, 2글자 이상일 때 -> True
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)

    }
    
}
