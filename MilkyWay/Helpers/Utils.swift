//
//  Utils.swift
//  MilkyWay
//
//  Created by Mohamed Magdy on 11/28/21.
//

import Foundation
class Utils{
    static let shared = Utils()
    
    func getFormattedDate(_ string: String? ) -> String{
        guard let s = string ,!s.isEmpty else{
            return ""
        }
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd MMM,yyyy"

        let date: Date? = dateFormatterGet.date(from: string!)
        return dateFormatterPrint.string(from: date!);
    }
    
    func readFromJson() -> [Items]? {
        let decoder = JSONDecoder()
        guard
            let url = jsonFilePath(),
             let data = try? Data(contentsOf: url),
             let items = try? decoder.decode([Items].self, from: data)
        else {
             return nil
        }

        return items
     }
    func writeResponseToFiles(items:[Items]?){
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(items) {
            let text = String(data: encoded, encoding: .utf8)!//just a text
            if let fileURL = jsonFilePath(){
                //writing
                do {
                    try text.write(to: fileURL, atomically: false, encoding: .utf8)
                }
                catch {/* error handling here */}
            }
        }

    }

    func jsonFilePath()->URL?{
        let file = "response.json"
                
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let fileURL = dir.appendingPathComponent(file)
            return fileURL

        }
        return nil
    }
}
