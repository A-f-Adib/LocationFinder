//
//  Country.swift
//  LocationFinder
//
//  Created by A.F. Adib on 5/1/25.
//

import Foundation

struct Country: Codable, Hashable {
    let name: String
    let code: String
    let range: String
    
    static var none: Country {
        Country(name: "Select Country", code: "XX", range: "")
    }
}
