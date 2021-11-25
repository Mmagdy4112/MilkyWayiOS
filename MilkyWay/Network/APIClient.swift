//
//  APIClient.swift
//  MilkyWay
//
//  Created by Mohamed Magdy on 11/24/21.
//

import RxSwift
import RxCocoa

class APIClient{
    let requestObservable = RequestObservable(config: .default)

    private func performRequest<T:Decodable>(router:APIRouter)->Observable<T>{
        return router.dataRequest(requestObservable: requestObservable)
    }
    
    func getItems() ->Observable<MilkyResponse>{
       return performRequest(router: APIRouter.search)
    }
    

}
fileprivate extension Encodable {
  var dictionaryValue:[String: Any?]? {
      guard let data = try? JSONEncoder().encode(self),
      let dictionary = try? JSONSerialization.jsonObject(with: data,
        options: .allowFragments) as? [String: Any] else {
      return nil
    }
    return dictionary
  }
}
