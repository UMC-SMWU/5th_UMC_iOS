//
//  ViewController.swift
//  study_3_TableView&CollectionView
//
//  Created by p_kxn_g on 2023/10/04.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myTableView: UITableView!
    
    let title_ = ["스티브 잡스", "빌 게이츠", "맥아더"]
    let map_ = ["59", "30", "70"]
    let cost_ = ["seoul", "paju", "goyang"]
                
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myTableView.dataSource = self
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
    UITableViewCell {
        let cell =
        myTableView.dequeueReusableCell(withIdentifier:"itemCell",for: indexPath)
        as! TableViewCell
        cell.title.text = title_ [indexPath.row]
        cell.map.text = map_ [indexPath.row]
        cell.cost.text = cost_[indexPath.row]
        return cell
    }
}

