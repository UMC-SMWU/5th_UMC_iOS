//
//  ViewController.swift
//  study_3_delegate
//
//  Created by p_kxn_g on 2023/10/04.
//

import UIKit

protocol ChangeLabelDelegate{
    func doChange()
}
class ViewController: UIViewController {
    @IBAction func buttonGoNextVC(_ sender: Any) {
        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else{
            return
        }
        nextVC.previousViewController = self
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true,completion: nil)
    }

    @IBOutlet weak var label: UILabel!
    var delegate : ChangeLabelDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

