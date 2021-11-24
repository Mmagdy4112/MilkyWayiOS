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
    var loading = LoadingView.shared

    func getDataFromApi(){
        loading.startAnimating()
        apiService.getItems{data in
            self.loading.stopAnimatimating()
            switch data{
            case .success(let response):
                self.milkyData = response
            case .failure(let error):
                AlertDialogHelper.sharedInstance.alertWindow(title: "error", message: error.localizedDescription)
            }
        }
    }
}
