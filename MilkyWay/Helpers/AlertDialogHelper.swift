//
//  class.swift
//  MilkyWay
//
//  Created by Mohamed Magdy on 11/24/21.
//

import Foundation
import UIKit

class AlertDialogHelper : NSObject {
    
    static let sharedInstance = AlertDialogHelper()
    //This is alert function
    func alertWindow(title: String, message: String,navigation:UINavigationController = UINavigationController()) {
        let alertWindow = UIWindow(frame: UIScreen.main.bounds)
        alertWindow.rootViewController = UIViewController()
        alertWindow.windowLevel = UIWindow.Level.alert + 1
        
        let alert2 = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction2 = UIAlertAction(title: "OK", style: .default, handler: { action in
        })
        alert2.addAction(defaultAction2)
        
        alertWindow.makeKeyAndVisible()
        navigation.present(alert2, animated: true, completion: nil)
    }
}
