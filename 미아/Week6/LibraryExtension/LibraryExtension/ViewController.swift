//
//  ViewController.swift
//  LibraryExtension
//
//  Created by 김세아 on 11/6/23.
//

import UIKit
import Pastel
import Lottie

class ViewController: UIViewController {
    @IBOutlet weak var downView: UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pastelView = PastelView(frame: view.bounds)
        
        // Custom Direction
        pastelView.startPastelPoint = .bottomLeft
        pastelView.endPastelPoint = .topRight
        
        // Custom Duration
        pastelView.animationDuration = 3.0
        
        // Custom Color
        pastelView.setColors([UIColor(red: 156/255, green: 39/255, blue: 176/255, alpha: 1.0),
                              UIColor(red: 255/255, green: 64/255, blue: 129/255, alpha: 1.0),
                              UIColor(red: 123/255, green: 31/255, blue: 162/255, alpha: 1.0),
                              UIColor(red: 32/255, green: 76/255, blue: 255/255, alpha: 1.0),
                              UIColor(red: 32/255, green: 158/255, blue: 255/255, alpha: 1.0),
                              UIColor(red: 90/255, green: 120/255, blue: 127/255, alpha: 1.0),
                              UIColor(red: 58/255, green: 255/255, blue: 217/255, alpha: 1.0)])
        
        pastelView.startAnimation()
        view.insertSubview(pastelView, at: 0)
        
        let animation = LottieAnimation.named("LottieAnimation")
        let animationView = LottieAnimationView(animation: animation)
        animationView.frame = CGRect(x: 0, y: 0, width: 600, height: 230)
        animationView.center = view.center
        
        
        //animationView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        //animationView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        
        
        view.addSubview(animationView)
                
        animationView.play()
        animationView.loopMode = .loop
        
        // Do any additional setup after loading the view.
    }
    
}

