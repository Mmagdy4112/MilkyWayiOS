//
//  APIRouter.swift
//  Notifire
//
//  Created by Mohamed Magdy on 11/24/21.
//

import Foundation

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
    func dataRequest<T: Decodable>(objectType:T.Type,completion: @escaping (Result<T>) -> Void) {
        //create the url with NSURL
        var dataURL = URL(string: ApiConstants.ProductionServer.baseURL)!
        dataURL.appendPathComponent(path)

        if let parameters = parameters , method == .GET{
            for (key, value) in parameters {
                dataURL =  dataURL.appending(key, value:"\(value)")
            }
        }
        //create the session object
        let session = URLSession.shared

        //now create the URLRequest object using the url object
        var request = URLRequest(url: dataURL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 60)

        request.httpMethod = method.rawValue

        if let parameters = parameters, method == .POST{
            request.httpBody = try! JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        }
        //create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request, completionHandler: { data, response, error in

            guard error == nil else {
                completion(Result.failure(APPError.networkError(error!)))
                return
            }

            guard let data = data else {
                completion(Result.failure(APPError.dataNotFound))
                return
            }
            
            do {
                ApiConstants.writeResponseToFiles(response: data!)
                //create decodable object from data
                let decodedObject = try JSONDecoder().decode(objectType.self, from: data)
                completion(Result.success(decodedObject))
            } catch let error {
                completion(Result.failure(APPError.jsonParsingError(error as! DecodingError)))
            }
        })

        task.resume()
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
