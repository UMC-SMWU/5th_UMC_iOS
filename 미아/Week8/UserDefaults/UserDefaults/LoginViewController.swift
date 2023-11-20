//
//  LogInViewController.swift
//  UserDefaults
//
//  Created by 김세아 on 11/20/23.
//

import UIKit
import FirebaseAuth
import FirebaseCore

class LogInViewController: UIViewController {
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var emailTf: UITextField!
    @IBOutlet weak var pwTf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logInButton.layer.cornerRadius = 4

    }
    
    @IBAction func logInButtonDidtap(_ sender: UIButton) {
        signInUser()
    }
    
    
    
    @IBAction func LogInTfEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        if text.count >= 4 {
            UIView.animate(withDuration: 0.33) {
                self.logInButton.backgroundColor = .systemMint
                self.logInButton.isEnabled = true
            }
        } else {
            self.logInButton.isEnabled = false
        }
    }
    
    fileprivate func signInUser() {
        guard let email = emailTf.text else { return }
        guard let pw = pwTf.text else { return }
        
       // guard let FailedViewController = self.storyboard?.instantiateViewController(withIdentifier: "LogInFailView") as! LogInViewController
        //guard let SucceedViewController = self.storyboard?.instantiateViewController(withIdentifier: "LogInSucceedView") as! LogInViewController
        //FailedViewController.modalPresentationStyle = .fullScreen
        //SucceedViewController.modalPresentationStyle = .fullScreen

           
           Auth.auth().signIn(withEmail: email, password: pw) { [self] authResult, error in
               if authResult == nil {
                   print("로그인 실패")
                   if let errorCode = error {
                       print(errorCode)
                   }
                   //self.present(FailedViewController, animated: true, completion: nil)
                   
               } else if authResult != nil {
                   print("로그인 성공")
                   //self.present(SucceedViewController, animated: true, completion: nil)
                   
               }
           }
       }
    

}
