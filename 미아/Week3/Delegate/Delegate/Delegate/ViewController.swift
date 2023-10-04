//
//  ViewController.swift
//  Protocol
//
//  Created by 김세아 on 10/4/23.
//

import UIKit

protocol ChangeLabelDelegate {
    func doChange()
}

class ViewController: UIViewController {

    @IBAction func buttonGoNextVC(_ sender: Any) {
        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else {
            return
        }
        nextVC.previousViewController = self
        nextVC.modalPresentationStyle = .fullScreen
        
    
        present(nextVC, animated: true, completion: nil)
    }
    
    @IBOutlet weak var label: UILabel!
    
    var delegate : ChangeLabelDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

