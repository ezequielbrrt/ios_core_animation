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
    var xAnchor:NSLayoutConstraint!
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
        basicView.translatesAutoresizingMaskIntoConstraints                      = false
        basicView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        basicView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        basicView.heightAnchor.constraint(equalToConstant: 200).isActive         = true
        basicView.widthAnchor.constraint(equalToConstant: 200).isActive          = true
        
        animateBox(to: .green)
        
    }
    
    fileprivate func animateBox(to color: UIColor){
        UIView.animate(withDuration: 0.3, delay: 1, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.basicView.backgroundColor = color
        })
    }


}

