//
//  MainViewModel.swift
//  MilkyWay
//
//  Created by Mohamed Magdy on 11/24/21.
//

import Foundation


class MainViewModel:NSObject{
    private(set) var milkyData : MilkyResponse?
    override init(){
        super.init()
    }
    weak var coordinator: MainCoordinator?
    private var apiService = APIClient()

    func getDataFromApi(){
        apiService.getItems{data in
            switch data{
            case .success(let response):
                self.milkyData = response
            case .failure(let error):
                AlertDialogHelper.sharedInstance.alertWindow(title: "error", message: error.localizedDescription)
            }
        }
    }
}
