//
//  TableViewCell.swift
//  BaeminDataTransition
//
//  Created by 김세아 on 11/4/23.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var ProductPrice: UILabel!
    @IBOutlet weak var PriceTopConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var MainImage: UIImageView!
    @IBOutlet weak var PriceDetailed: UILabel!
    @IBOutlet weak var DeleteBtn: UIButton!
    @IBOutlet weak var OptionBtn: UIButton!
    
    @IBOutlet weak var CrustOption: UILabel!
    
    @IBOutlet weak var Quantity: UIView!
    @IBOutlet weak var MinusQty: UIButton!
    @IBOutlet weak var PlusQty: UIButton!
    @IBOutlet weak var NumQty: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
