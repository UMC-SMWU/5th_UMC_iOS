//
//  ViewController.swift
//  BaeminDataTransition
//
//  Created by 김세아 on 11/1/23.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var gradientView: UIView!
    
    @IBAction func didTapBtn(_ sender: UIButton) {
        sender.isSelected.toggle()
    }
    
    //가격 옵션의 버튼 2개 중 1개만 선택할 수 있도록 제한
    @IBAction func selectOptionBtnAction(_ sender: UIButton) {
        //가격 탭에서 M 또는 L을 선택해야 도우 변경을 진행할 수 있게 설정
        CheeseCrust.isEnabled = true
        
        for Btn in BtnArray {
            if Btn == sender {
                // 만약 현재 버튼이 이 함수를 호출한 버튼이라면
                Btn.isSelected = true
            } else {
                // 이 함수를 호출한 버튼이 아니라면
                Btn.isSelected = false
            }
        }
        
        if SizeM.isSelected == true && CheeseCrust.isSelected == false {
         PriceLabel.text = "20,000원 담기"
         } else if SizeM.isSelected == false && CheeseCrust.isSelected == false {
         PriceLabel.text = "23,000원 담기"
         } else if SizeM.isSelected == true && CheeseCrust.isSelected == true {
         PriceLabel.text = "24,500원 담기"
         } else if SizeM.isSelected == false && CheeseCrust.isSelected == true {
         PriceLabel.text = "27,500원 담기"
         } else {
         PriceLabel.text = "0원 담기"
         }
    }
    
    
    @IBOutlet weak var PriceLabel: UILabel!
    
    @IBOutlet weak var SizeM: UIButton!
    @IBOutlet weak var SizeL: UIButton!
    
    @IBOutlet weak var CheeseCrust: UIButton!
    
    
    var BtnArray = [UIButton]() //UIButton 배열 선언
    
    override func viewDidLoad() {
        gradientView.setGradient(color1: UIColor(white: 0.0, alpha: 0.7), color2: UIColor(white: 1.0, alpha: 0.0))
        super.viewDidLoad()
        
        //선택옵션을 위해 배열에 버튼 추가
        BtnArray.append(SizeM)
        BtnArray.append(SizeL)
        
    }
    
    @IBAction func labelSwitch(_ sender: UIButton) {
        
        if SizeM.isSelected == true && CheeseCrust.isSelected == false {
         PriceLabel.text = "20,000원 담기"
         } else if SizeM.isSelected == false && CheeseCrust.isSelected == false {
         PriceLabel.text = "23,000원 담기"
         } else if SizeM.isSelected == true && CheeseCrust.isSelected == true {
         PriceLabel.text = "24,500원 담기"
         } else if SizeM.isSelected == false && CheeseCrust.isSelected == true {
         PriceLabel.text = "27,500원 담기"
         } else {
         PriceLabel.text = "0원 담기"
         }
        
        /*switch SizeM.isSelected {
        case true:
            if CheeseCrust.isSelected == false {
                PriceLabel.text = "20,000원 담기"
            } else {
                PriceLabel.text = "24,500원 담기"
            }
        case false:
            if CheeseCrust.isSelected == false {
                PriceLabel.text = "23,000원 담기"
            } else {
                PriceLabel.text = "27,500원 담기"
            }
        }*/
    }
    
    //property 접근을 통한 데이터 직접 전달
    @IBAction func dataTransition(_ sender: Any) {
        guard let SecondVC = storyboard?.instantiateViewController(identifier: "SecondVC") as? SecondViewController else { return }
        
        //띄어쓰기를 기준으로 문자열 분리(SubString 만들기)
        let sendTextArr = self.PriceLabel.text?.split(separator: " ")
        
        //optional 해제 및 String 변환해 띄어쓰기 기준 앞 글자('~원'까지)만 받아오기
        let sendText = String(sendTextArr![0])
        SecondVC.priceText = sendText
        
        //화면 전환(이거 없이 main storyboard에서 전환시키는거 그냥 쓰면 오류 발생)
        SecondVC.modalPresentationStyle = .fullScreen
        self.present(SecondVC, animated: true, completion: nil)
    }
    
}


extension UIView {
    func setGradient(color1:UIColor, color2:UIColor){
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [color1.cgColor, color2.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.frame = bounds
        layer.addSublayer(gradient)
    }
}

