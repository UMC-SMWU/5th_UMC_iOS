//
//  TableViewCell.swift
//  study_3_TableView&CollectionView
//
//  Created by p_kxn_g on 2023/10/04.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var map: UILabel!
    @IBOutlet weak var cost: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
