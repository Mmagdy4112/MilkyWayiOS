//
//  ImageEx.swift
//  MilkyWay
//
//  Created by Mohamed Magdy on 11/25/21.
//

import UIKit
import RxSwift
import RxCocoa

extension UIImageView {
    
    func imageFromUrl(_ URLString: String,disposeBag:DisposeBag){
        self.image = nil

        //If imageurl's imagename has space then this line going to work for this
        let imageServerUrl = URLString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let request = URLRequest(url: URL(string: imageServerUrl)!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 60)

        URLSession.shared.rx
            .response(request: request)
            // subscribe on main thread
            .subscribe(on: MainScheduler.instance)
               .subscribe(onNext: { [weak self] response in
                // Update Image
                   DispatchQueue.main.async {
                       self?.image = UIImage(data: response.data)
                   }
               }, onError: {_ in
                // Log error
            }, onCompleted: {
                // animate image view alpha
                DispatchQueue.main.async {
                    UIView.animate(withDuration: 0.3) {
                        self.alpha = 1
                    }
                }
            }).disposed(by: disposeBag)
    }
}
