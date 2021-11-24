//
//  APIConfiguration.swift
//  Notifire
//
//  Created by Mohamed Magdy on 11/24/21.
//

typealias Parameters = [String:Any]
protocol APIConfiguration {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
}
enum HTTPMethod: String{
    case POST
    case GET

}
