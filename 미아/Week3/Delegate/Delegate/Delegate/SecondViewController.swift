//
//  SecondViewController.swift
//  Protocol
//
//  Created by 김세아 on 10/4/23.
//

import UIKit

class SecondViewController: UIViewController, ChangeLabelDelegate {
    func doChange() {
        previousViewController?.label.text = self.textField.text
    }
    

    @IBOutlet weak var textField: UITextField!
    
    var previousViewController : ViewController?
    
    @IBAction func buttonDismiss(_ sender: Any) {
        //버튼이 눌림과 동시에 텍스트값이 바뀜
        doChange()
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        previousViewController?.delegate = self
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
