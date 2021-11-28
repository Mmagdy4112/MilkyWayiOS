//
//  ApiConstants.swift
//  Notifire
//
//  Created by Mohamed Magdy on 11/24/21.
//

import Foundation
struct ApiConstants{
    struct ProductionServer {
        static var baseURL = "https://images-api.nasa.gov/"
    }

    
    enum ParamterKeys:String{
        case jsonrpc , method
    }

}

enum HTTPHeaderField: String {
    case contentType = "Content-Type"
    case accept = "accept"

}

enum ContentType: String {
    case json = "application/json"
}

