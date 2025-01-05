//
//  Location.swift
//  LocationFinder
//
//  Created by A.F. Adib on 5/1/25.
//

import Foundation


struct Location: Codable {
    
    var country: String
    
    struct Place: Codable {
        var placeName: String
        var longitude: String
        var state: String
        var latitude: String
        
        enum CodingKeys: String, CodingKey {
            case placeName = "place name"
            case longitude
            case state
            case latitude
        }
    }
    
    var places: [Place]
}
