//
//  MapView.swift
//  LocationFinder
//
//  Created by A.F. Adib on 6/1/25.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    let longitude: Double
    let latitude: Double
    
    @State private var mapRegion : MKCoordinateRegion
    
    init(longitude: Double, latitude: Double) {
        self.longitude = longitude
        self.latitude = latitude
        self.mapRegion = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: latitude ,
                                           longitude: longitude),
            span: MKCoordinateSpan(latitudeDelta: 0.2,
                                   longitudeDelta: 0.2))
    }
    
    var body: some View {
        Map(coordinateRegion: $mapRegion)
    }
}

#Preview {
    MapView(longitude: -73.9894536, latitude: 40.7484445 )
}
