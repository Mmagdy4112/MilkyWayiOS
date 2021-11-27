//
//  DetailsViewModel.swift
//  MilkyWay
//
//  Created by Mohamed Magdy on 11/25/21.
//

import RxSwift
import RxCocoa
class DetailsViewModel:NSObject{
    private(set) var item : Items!
    weak var coordinator: MainCoordinator?
    let disposeBag = DisposeBag()

    override init() {
        super.init()
    }
    init(item : Items) {
        self.item = item
        super.init()
    }
    
}
