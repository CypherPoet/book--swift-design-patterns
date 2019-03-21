//
//  ViewController.swift
//  MVVM Bindings in Practice
//
//  Created by Brian Sipple on 3/20/19.
//  Copyright © 2019 Brian Sipple. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var usernameTextField: BoundTextField!
    
    lazy var user = User(name: Observable("CypherPoet"))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: { [weak self] in
            self?.user.name.value = "Bilbo Baggins"
        })
    }
}


// MARK: - Private Helper Methods

private extension HomeViewController {
    func setupUI() {
        usernameTextField.bind(to: user.name)
    }
}

