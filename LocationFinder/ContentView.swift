//
//  ContentView.swift
//  LocationFinder
//
//  Created by A.F. Adib on 5/1/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var locationService = LocationService()
    @State private var selectCountry = Country.none
    
    var body: some View {
        
        NavigationStack {
            VStack {
                Picker("Select Country", selection: $selectCountry) {
                    ForEach(locationService.countries, id: \.code) { country in
                        Text(country.name).tag(country)
                    }
                }
                .buttonStyle(.bordered)
                Spacer()
            }
            .navigationTitle("Location Finder")
        }
       
    }
}

#Preview {
    ContentView()
}
