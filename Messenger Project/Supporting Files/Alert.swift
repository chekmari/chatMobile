//
//  Alert.swift
//  Messenger Project
//
//  Created by macbook on 11.08.2023.
//

import Foundation
import UIKit

extension UIViewController {
    public func createAlert(title: String, message: String, buttonText: String) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: buttonText, style: .default)
        alertController.addAction(action)
        return alertController
    }
}


