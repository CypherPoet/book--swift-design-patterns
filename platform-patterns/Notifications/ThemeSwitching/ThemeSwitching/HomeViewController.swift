//
//  ViewController.swift
//  ThemeSwitching
//
//  Created by Brian Sipple on 3/30/19.
//  Copyright © 2019 Brian Sipple. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        UIView.animate(withDuration: 1.0, delay: 2.0, animations: {
            NotificationCenter.default.post(name: .HWSThemeDidChange, object: nil)
        })
    }
}


private extension HomeViewController {
    func setupUI() {
        let themedWindowFrame = CGRect(x: 0, y: 0, width: 0, height: 0)
        let themedWindow = UIView(frame: themedWindowFrame)
        
        themedWindow.translatesAutoresizingMaskIntoConstraints = false
        themedWindow.backgroundColor = #colorLiteral(red: 0.7378355861, green: 0.7780200839, blue: 1, alpha: 1)
        
        view.addSubview(themedWindow)
        themedWindow.makeThemeable()
        
        NSLayoutConstraint.activate([
            themedWindow.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            themedWindow.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            themedWindow.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.33),
            themedWindow.heightAnchor.constraint(equalTo: themedWindow.widthAnchor),
        ])
    }
}

