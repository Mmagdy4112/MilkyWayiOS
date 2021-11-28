//
//  MainViewModel.swift
//  MilkyWay
//
//  Created by Mohamed Magdy on 11/24/21.
//

import Foundation
import RxSwift
import RxCocoa
class MainViewModel:NSObject{
    private(set) var milkyData : MilkyResponse?
    var items = PublishSubject<[Items]>()
    let disposeBag = DisposeBag()
    weak var coordinator: MainCoordinator?
    private var apiService = APIClient()
    var loading = LoadingView.shared
    
    override init(){
        super.init()
        getDataFromApi()
    }
    
    
    func getDataFromApi(){
        // load data from json file if exist then load service to update data
        loading.startAnimating()
        if let items = Utils.shared.readFromJson(){
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.items.onNext(items)
                self.items.onCompleted()
                self.loading.stopAnimatimating()
            }
            
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.apiService.getItems().subscribe(
            onNext: { result in
                //MARK: display in UITableView
                if let items = result.collection?.items{
                    self.items.onNext(items)
                    self.items.onCompleted()
                    // store data to json file
                    Utils.shared.writeResponseToFiles(items: items)
                }
            },
            onError: { error in
                DispatchQueue.main.async {
                    AlertDialogHelper.sharedInstance.alertWindow(title: "error", message: error.localizedDescription)
                }
            },
            onCompleted: {
                DispatchQueue.main.async {
                    self.loading.stopAnimatimating()
                }
            }).disposed(by: self.disposeBag)
        }
    }
}
