//
//  ViewController.swift
//  MilkyWay
//
//  Created by Mohamed Magdy on 11/24/21.
//

import UIKit
import RxSwift
import RxCocoa

class MainViewController: UIViewController,Storyboarded {
    @IBOutlet weak var tableView: UITableView!
    var mainViewModel : MainViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        bindTable()
    }

    func bindTable(){
        mainViewModel.items.bind(to: tableView.rx.items(cellIdentifier: String(describing: MilkyCell.self), cellType: MilkyCell.self))
        {row,items,cell in
            cell.titleLabel.text = items.data?[0].title
            cell.dateLabel.text = items.data?[0].date_created
            cell.centerLabel.text = items.data?[0].center
            let urlString = (items.links?[0].href ?? "").addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            cell.img.imageFromUrl(urlString!, disposeBag: self.mainViewModel.disposeBag)
        }.disposed(by: mainViewModel.disposeBag)
        tableView.rx.modelDeleted(Items.self).bind{ item in
            
        }.disposed(by: mainViewModel.disposeBag)
        tableView.rx.modelSelected(Items.self).subscribe(onNext: {model in
            self.mainViewModel.coordinator?.navigateToDetails(item: model)
        }).disposed(by: mainViewModel.disposeBag)
    }
    

}


extension Reactive where Base: UICollectionView {
    public func modelAndIndexSelected<T>(_ modelType: T.Type) -> ControlEvent<(T, IndexPath)> {
        ControlEvent(events: Observable.zip(
            self.modelSelected(modelType),
            self.itemSelected
        ))
    }
}
