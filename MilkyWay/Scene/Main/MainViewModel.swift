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
        loading.startAnimating()
        apiService.getItems().subscribe(
            onNext: { result in
               //MARK: display in UITableView
                if let items = result.collection?.items{
                    self.items.onNext(items)
                    self.items.onCompleted()
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
            }).disposed(by: disposeBag)
        
//        apiService.getItems{data in
//            self.loading.stopAnimatimating()
//            switch data{
//            case .success(let response):
//                self.milkyData = response
//                if let items = response.collection?.items {
//                    self.items.onNext(items)
//                }
//            case .failure(let error):
//            }
//        }
    }
}
