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

    
    static func writeResponseToFiles(response:Data){
        let file = "file.txt" //this is the file. we will write to and read from it
        
        let text = String(data: response, encoding: .utf8)!//just a text
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let fileURL = dir.appendingPathComponent(file)
            print(fileURL.path)
            //writing
            do {
                try text.write(to: fileURL, atomically: false, encoding: .utf8)
            }
            catch {/* error handling here */}
            
            //reading
            do {
                let text2 = try String(contentsOf: fileURL, encoding: .utf8)
            }
            catch {/* error handling here */}
        }
    }
}

enum HTTPHeaderField: String {
    case contentType = "Content-Type"
    case accept = "accept"

}

enum ContentType: String {
    case json = "application/json"
}

