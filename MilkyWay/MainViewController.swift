//
//  ViewController.swift
//  MilkyWay
//
//  Created by Mohamed Magdy on 11/24/21.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("helloooo")
        APIClient().getItems{data in
            switch data{
            case .success(let object):
                print(object)
            case .failure(let error):
                print(error)
            }
            
        }
    }


}

