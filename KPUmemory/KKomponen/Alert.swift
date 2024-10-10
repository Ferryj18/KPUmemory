//
//  Alert.swift
//  KPUmemory
//
//  Created by Ferry jati on 27/08/23.
//

import Foundation
import UIKit

class Alert {
    static func showGeneralAlert(title: String, message: String, viewController: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // Add actions (buttons) to the alert if needed
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        
        // Present the alert
        viewController.present(alert, animated: true, completion: nil)
    }
    
    static func showGeneralAlertWithTitleButton(title: String, message: String, btnTitle: String, viewController: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // Add actions (buttons) to the alert if needed
        var titleButton: String = ""
        switch btnTitle {
        case nil :
            titleButton = "OK"
        case "" :
            titleButton = "OK"
        default:
            titleButton = btnTitle
        }
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        
        // Present the alert
        viewController.present(alert, animated: true, completion: nil)
    }
}
