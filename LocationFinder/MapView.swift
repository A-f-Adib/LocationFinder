//
//  MapView.swift
//  LocationFinder
//
//  Created by A.F. Adib on 6/1/25.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State private var mapRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 40.7484445,
                                       longitude: -73.9894536),
        span: MKCoordinateSpan(latitudeDelta: 0.2,
                               longitudeDelta: 0.2)
    )
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    MapView()
}
