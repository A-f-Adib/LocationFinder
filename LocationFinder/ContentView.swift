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
    @State private var code = ""
    
    var body: some View {
        
        NavigationStack {
            VStack {
                Picker("Select Country", selection: $selectCountry) {
                    ForEach(locationService.countries, id: \.code) { country in
                        Text(country.name).tag(country)
                    }
                }
                .buttonStyle(.bordered)
                
                if selectCountry != .none {
                    Text(selectCountry.range)
                    Text("Postal Code/Zip Range")
                        .font(.caption)
                        .foregroundStyle(Color.blue)
                    
                    TextField("Code", text: $code)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 100)
                    
                    Button("Get Location") {
                        Task {
                            await locationService.fetchLocation(for: selectCountry.code, postalCode: code)
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(code.isEmpty)
                    
                    if let errorString = locationService.errorString {
                        Text(errorString)
                            .foregroundStyle(Color.red)
                    }
                    if let locationInfo = locationService.locationInfo {
                        Text(locationInfo.placeName)
                        Text(locationInfo.state)
                    }
                }
                if locationService.locationInfo == nil {
                    Image("locationFinder")
                }
                Spacer()
            }
            .navigationTitle("Location Finder")
            .onChange(of: selectCountry) {
                locationService.reset()
                code = ""
            }
           
        }
       
    }
}

#Preview {
    ContentView()
}
