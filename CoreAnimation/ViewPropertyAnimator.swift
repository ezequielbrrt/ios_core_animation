//
//  ViewPropertyAnimator.swift
//  CoreAnimation
//
//  Created by beTech CAPITAL on 04/06/20.
//  Copyright © 2020 Ezequiel Barreto. All rights reserved.
//

import UIKit

class ViewPropertyAnimator: UIViewController{
    
    var animator: UIViewPropertyAnimator!
    var boxWidthAnchor: NSLayoutConstraint!
    let box = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
    }
    
    
    private func setUpView(){
        view.backgroundColor = .white
        
        
        view.addSubview(box)
        box.translatesAutoresizingMaskIntoConstraints = false
        box.backgroundColor = .yellow
        boxWidthAnchor = box.widthAnchor.constraint(equalToConstant: 100)
        boxWidthAnchor.isActive = true
        
        box.heightAnchor.constraint(equalToConstant: 100).isActive = true
        box.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        box.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
//        animator.addAnimations {
//            box.backgroundColor = .red
//            self.view.layoutIfNeeded()
//        }
//
                
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(slider)
        slider.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        slider.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100).isActive = true
        slider.widthAnchor.constraint(equalToConstant: view.frame.width - 150).isActive = true
        
        slider.addTarget(self, action: #selector(handleSliderChange(slider:)), for: .allEvents)
    }
    
    @objc private func handleSliderChange(slider: UISlider){
        print(slider.value)
        boxWidthAnchor.constant = 100 + CGFloat(slider.value * 100)
        //animator.fractionComplete = CGFloat(slider.value)
        animator = UIViewPropertyAnimator(duration: 2, dampingRatio: 0.5, animations: {
            self.view.layoutIfNeeded()
            self.box.backgroundColor = .blue
        })
        animator.startAnimation()

    }
    
}
