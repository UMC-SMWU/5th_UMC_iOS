//
//  SecondViewController.swift
//  BaeminDataTransition
//
//  Created by 김세아 on 11/4/23.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tabPrice: UILabel!
    
    var priceText : String? //앞 ViewController에서 가져온 텍스트를 직접 대입할 수 없으므로 priceText를 정의해 대입
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tabPrice.text = priceText
        
    }
}



extension SecondViewController: UITableViewDataSource {
    
    //들어갈 cell 개수 지정
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    //prototype cell 높이 지정을 storyboard에서 진행했을 때 적용되지 않는 오류가 있어 작성
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    //prototype cell 지정(기본 cell 지정)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableProtoCell", for: indexPath) as! TableViewCell
        //금액을 이전 화면에서 받아온 텍스트로 변경
        cell.ProductPrice.text = priceText
        
        if priceText == "0원" {
            cell.CrustOption.isHidden = true
            cell.PriceDetailed.isHidden = true
            cell.PriceTopConstraint.constant = -34
            
            cell.ProductPrice.text = "ERROR"
            cell.ProductPrice.textColor = UIColor.red
            
        } else if priceText == "20,000원" {
            cell.CrustOption.isHidden = true
            cell.PriceTopConstraint.constant = -12
            
        } else if priceText == "23,000원" {
            cell.CrustOption.isHidden = true
            cell.PriceTopConstraint.constant = -12
            cell.PriceDetailed.text = "∙가격 : L (23,000원)"
            
        } else if priceText == "27,500원" {
            cell.PriceDetailed.text = "∙가격 : L (23,000원)"
        }
        
        
        
        return cell
    }
    
}
