//
//  MainViewController.swift
//  Messenger Project
//
//  Created by macbook on 11.08.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        view.addSubview(label)
        
        
        label.text = "авторазация прошла успешно"
        label.textColor = .white
        label.center = view.center
    }
    

    

}
