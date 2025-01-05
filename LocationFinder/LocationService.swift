//
//  LocationService.swift
//  LocationFinder
//
//  Created by A.F. Adib on 5/1/25.
//

import Foundation

class LocationService: ObservableObject {
    
    @Published var countries : [Country] = []
    
    init() {
        loadCountries()
    }
    
    func loadCountries() {
        
        //Checking if the countries.json file exist or not
        guard let url = Bundle.main.url(forResource: "Countries", withExtension: "json") else {
            fatalError("Failed to locate Countries.json in the bundle")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load Countries.json from the bundle")
        }
        
        //Decoding the data
        do {
            countries = try JSONDecoder().decode([Country].self, from: data)
            countries.insert(Country.none, at: 0)
        } catch {
            fatalError("Failed to decode Countries.json from data")
        }
    }
}
