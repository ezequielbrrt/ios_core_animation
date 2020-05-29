//
//  ViewController.swift
//  CoreAnimation
//
//  Created by beTech CAPITAL on 29/05/20.
//  Copyright © 2020 Ezequiel Barreto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let basicView = UIView()
    var yAnchor:NSLayoutConstraint!
    var widthAnchor:NSLayoutConstraint!
    var heightAnchor:NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(basicView)
        configUI()
        prepareBasicView()
    }
    
    private func configUI(){
        self.view.backgroundColor = .white
    }
    
    private func prepareBasicView(){
        basicView.backgroundColor = .blue
        basicView.translatesAutoresizingMaskIntoConstraints = false
        
        yAnchor = basicView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        yAnchor.isActive = true
        
        basicView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        heightAnchor = basicView.heightAnchor.constraint(equalToConstant: 200)
        heightAnchor.isActive = true
        
        widthAnchor = basicView.widthAnchor.constraint(equalToConstant: 200)
        widthAnchor.isActive = true
        
        perform(#selector(self.animateBox), with: nil, afterDelay: 1)
        
        
        basicView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(animateOnTap)))
        
    }
    
    @objc fileprivate func animateBox(){
        
        yAnchor.isActive = false
        yAnchor = basicView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100)
        yAnchor.isActive = true

        
        widthAnchor.isActive = false
        widthAnchor = basicView.widthAnchor.constraint(equalToConstant: 300)
        widthAnchor.isActive = true
        
        
        heightAnchor.isActive = false
        heightAnchor = basicView.heightAnchor.constraint(equalToConstant: self.view.frame.height - 50)
        heightAnchor.isActive = true
        
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        })
    }

    var tapped: Bool = false

    @objc func animateOnTap(){
        
        if tapped{
            widthAnchor.isActive = false
            widthAnchor = basicView.widthAnchor.constraint(equalToConstant: self.view.frame.width / 2)
            widthAnchor.isActive = true
        }else{
            yAnchor.isActive = false
            yAnchor = basicView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 200)
            yAnchor.isActive = true

            widthAnchor.isActive = false
            widthAnchor = basicView.widthAnchor.constraint(equalToConstant: self.view.frame.width - 20)
            widthAnchor.isActive = true
            
            heightAnchor.isActive = false
            heightAnchor = basicView.heightAnchor.constraint(equalToConstant: 200)
            heightAnchor.isActive = true
        }
        
        self.tapped = !self.tapped
        
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        })
    }
}

