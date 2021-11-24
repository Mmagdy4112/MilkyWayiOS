//
//  Coordinator.swift
//  MilkyWay
//
//  Created by Mohamed Magdy on 11/24/21.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    func start()
}
