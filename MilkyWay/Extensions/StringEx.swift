//
//  StringEx.swift
//  MilkyWay
//
//  Created by Mohamed Magdy on 11/25/21.
//

import Foundation

extension String {
    
    func classNameAsString(_ obj: Any) -> String {
        //prints more readable results for dictionaries, arrays, Int, etc
        return String(describing: type(of: obj))
    }
}
