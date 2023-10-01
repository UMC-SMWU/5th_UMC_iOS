//
//  TableViewCell.swift
//  CarrotMarketHome
//
//  Created by 김세아 on 2023/09/29.
//

import UIKit

class TableViewCell: UITableViewCell {


    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var localTime: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var heart: UILabel!
    @IBOutlet weak var reservation: UIButton!
    
    @IBOutlet weak var messageIcon: UIButton!
    @IBOutlet weak var heartIcon: UIButton!
    
    @IBOutlet weak var imageLogo: UIImageView!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
