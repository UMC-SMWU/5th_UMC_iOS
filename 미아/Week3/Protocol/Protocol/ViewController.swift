//
//  ViewController.swift
//  Protocol
//
//  Created by 김세아 on 10/4/23.
//

import UIKit

protocol Flyable {
    func fly()
}

protocol Runnable {
    func run()
}

class Person : Flyable, Runnable {
    func fly() {
        print("날았음")
    }
    func run() {
        print("달렸음")
    }
}

class ViewController: UIViewController {

    let person = Person()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        person.fly()
        person.run()
    }


}

