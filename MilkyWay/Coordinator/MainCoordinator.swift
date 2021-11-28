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
        let vc = MainViewController.instantiate()
        let viewmodel = MainViewModel()
        viewmodel.coordinator = self
        vc.mainViewModel = viewmodel
        navigationController.viewControllers = [vc]
    }
    func navigateToDetails(item:Items) {
        let vc = DetailsViewController.instantiate(storyBoard: "Main")
        let viewmodel =  DetailsViewModel(item: item)
        viewmodel.coordinator = self
        vc.detailsViewModel = viewmodel
        navigationController.navigationBar.topItem?.title = "The Milky Way"
        navigationController.pushViewController(vc, animated: true)
    }
}

