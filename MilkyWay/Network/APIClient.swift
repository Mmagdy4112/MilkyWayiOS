//
//  APIClient.swift
//  MilkyWay
//
//  Created by Mohamed Magdy on 11/24/21.
//

import Foundation

class APIClient{
    
    private func performRequest<T:Decodable>(router:APIRouter,completion:@escaping(Result<T>)->Void){
        return router.dataRequest(objectType: T.self){result in
            completion(result)
        }
    }
    
    func getItems(completion:@escaping(Result<MilkyResponse>)->Void){
        performRequest(router: APIRouter.search, completion: completion)
    }
    

}
