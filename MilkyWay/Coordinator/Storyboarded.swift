//
//  Storyboarded.swift
//  MilkyWay
//
//  Created by Mohamed Magdy on 11/24/21.
//

import UIKit
protocol Storyboarded {
    static func instantiate(storyBoard:String) -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate(storyBoard:String = "Main") -> Self {
        // this pulls out "MyApp.MyViewController"
        let fullName = NSStringFromClass(self)

        // this splits by the dot and uses everything after, giving "MyViewController"
        let className = fullName.components(separatedBy: ".")[1]

        // load our storyboard
        let storyboard = UIStoryboard(name: storyBoard , bundle: Bundle.main)

        // instantiate a view controller with that identifier, and force cast as the type that was requested
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
