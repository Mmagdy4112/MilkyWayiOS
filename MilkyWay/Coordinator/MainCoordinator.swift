//
//  MainCoordinator.swift
//  MilkyWay
//
//  Created by Mohamed Magdy on 11/24/21.
//

import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController.navigationBar.shadowImage = UIImage()
        self.navigationController.navigationBar.isTranslucent = true
    }

    func start() {
        let vc = MainViewController.instantiate(storyBoard: "Main")
        navigationController.viewControllers = [vc]
    }
   
}