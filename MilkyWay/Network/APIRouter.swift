//
//  APIRouter.swift
//  Notifire
//
//  Created by Mohamed Magdy on 11/24/21.
//

import RxSwift
import RxCocoa

enum APIRouter: APIConfiguration {
    case search
    // MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
        case .search:
            return .GET
        }
    }
    
    // MARK: - Path
    var path: String {
        switch self {
        case .search :
            return "search"
        }
    }
    
    // MARK: - Parameters
    var parameters: Parameters? {
        switch self {
        case .search:
            return ["q":22]
        }
    }
    
    
    //dataRequest which sends request to given URL and convert to Decodable Object
    func dataRequest<T: Decodable>(requestObservable:RequestObservable) -> Observable<T> {
        //create the url with NSURL
        var dataURL = URL(string: ApiConstants.ProductionServer.baseURL)!
        dataURL.appendPathComponent(path)

        if let parameters = parameters , method == .GET{
            for (key, value) in parameters {
                dataURL =  dataURL.appending(key, value:"\(value)")
            }
        }

        //now create the URLRequest object using the url object
        var request = URLRequest(url: dataURL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 60)

        request.httpMethod = method.rawValue

        if let parameters = parameters, method == .POST{
            request.httpBody = try! JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        }
        return requestObservable.callAPI(request: request)
    }
    
}

//APPError enum which shows all possible errors
enum APPError: Error {
    case networkError(Error)
    case dataNotFound
    case jsonParsingError(Error)
    case invalidStatusCode(Int)
}

//Result enum to show success or failure
enum Result<T> {
    case success(T)
    case failure(APPError)
}
