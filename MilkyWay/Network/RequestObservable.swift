//
//  RequestObservable.swift
//  MilkyWay
//
//  Created by Mohamed Magdy on 11/25/21.
//

import RxSwift
import RxCocoa

public class RequestObservable {
    private lazy var jsonDecoder = JSONDecoder()
    private var urlSession: URLSession
    public init(config:URLSessionConfiguration) {
        urlSession = URLSession(configuration:
                                    URLSessionConfiguration.default)
    }
    //MARK: function for URLSession takes
    public func callAPI<T: Decodable>(request: URLRequest)
    -> Observable<T> {
        //MARK: creating our observable
        return Observable.create { observer in
            //MARK: create URLSession dataTask
            let task = self.urlSession.dataTask(with: request) { (data,
                                                                  response, error) in
                if let httpResponse = response as? HTTPURLResponse{
                    let statusCode = httpResponse.statusCode
                    do {
                        let _data = data ?? Data()
                        if (200...399).contains(statusCode) {
                            let objs = try self.jsonDecoder.decode(T.self, from:
                                                                    _data)
                            //MARK: observer onNext event
                            observer.onNext(objs)
                        }else {
                            guard error == nil else {
                                observer.onError(Result<T>.failure(APPError.networkError(error!)) as! Error)
                                return
                            }

                            guard !self.isValidHtmlString(String(data: data!, encoding: .utf8)!) else {
                                let err = NSError(domain:"Data Not Found", code:0, userInfo:nil)
                                observer.onError(err)
                                return
                            }
                            observer.onError(error!)
                        }
                    } catch {
                        //MARK: observer onNext event
                        observer.onError(error)
                    }
                }
                //MARK: observer onCompleted event
                observer.onCompleted()
            }
            task.resume()
            //MARK: return our disposable
            return Disposables.create {
                task.cancel()
            }
        }
    }
    func isValidHtmlString(_ value: String) -> Bool {
        if value.isEmpty {
            return false
        }
        return (value.range(of: "<(\"[^\"]*\"|'[^']*'|[^'\">])*>", options: .regularExpression) != nil)
    }

}
