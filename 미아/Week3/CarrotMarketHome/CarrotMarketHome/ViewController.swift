//
//  ViewController.swift
//  CarrotMarketHome
//
//  Created by 김세아 on 2023/09/28.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
}


extension ViewController: UITableViewDataSource {
    
    //행이 몇 개인지
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //셀의 기본값 지정
        let cell = tableView.dequeueReusableCell(withIdentifier: "base", for: indexPath) as! TableViewCell

        
        let titleArray = ["[급구] 50만원 제공! 쿵야 레스토랑에서 시식 알바 구함니다.^^ - 🧅", "에어팟맥스실버", "에어팟 맥스 스페이스그레이 S급 풀박 판매합니다.", "[S급]에어팟 맥스 스페이스 그레이 풀박 판매합니다.", "보일러 온돌(배관) 고장났을 땐?"]
        let localTimeArray = ["당근알바 ∙ 이벤트", "서울특별시 양천구 ∙ 6일 전", "서울특별시 양천구 ∙ 3시간 전", "서울특별시 양천구 ∙ 1일 전", "청양동 ∙ 광고"]
        let priceArray = ["", "370,000원", "490,000원", "550,000원", ""]
        let messageArray = ["", "5", "1", "1", ""]
        let heartArray = ["", "23", "4", "7", ""]
        let imageArray = ["image1", "image2", "image3", "image4", "image5"]
        
        cell.title.text = titleArray[indexPath.row]
        cell.localTime.text = localTimeArray[indexPath.row]
        cell.price.text = priceArray[indexPath.row]
        cell.message.text = messageArray[indexPath.row]
        cell.heart.text = heartArray[indexPath.row]
        cell.imageLogo.image = UIImage(named: imageArray[indexPath.row])
        //print(indexPath)
        cell.reservation.isHidden = true
        
        //localTime의 constraints를 우측으로 56만큼 옮기고 싶은데 그게 안 됨!
        //cell.localTime.leftAnchor.constraint(equalTo: view.leadingAnchor, constant: 135).isActive = true
        
    if indexPath.row == 0 {
            cell.heartIcon.isHidden = true
            cell.messageIcon.isHidden = true
        }
        
    //예약중 버튼 나타나게 하기
    /* if indexPath.row == 1 {
        cell.reservation.isHidden = false
    }*/
    if indexPath.row == 4 {
            cell.heartIcon.isHidden = true
            cell.messageIcon.isHidden = true
        }
        
        
        /*
        for num in messageArray {
            if num == "" {
                cell.heartIcon.isHidden = false
                cell.messageIcon.isHidden = false
               
            } else {
                cell.heartIcon.isHidden = true
                cell.messageIcon.isHidden = true
                
            }
        }
         */
        
        return cell
        
    }

}
