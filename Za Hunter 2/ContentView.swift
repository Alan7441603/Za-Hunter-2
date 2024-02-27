//
//  ContentView.swift
//  Za Hunter 2
//
//  Created by Alan Rivera on 2/26/24.
//

import SwiftUI
import MapKit
struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    @State private var places = [Place]()
    @State private var userTrackingMode: MapUserTrackingMode = .follow
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
        latitude: 42.15704,
        longitude: -88.14812),
        span: MKCoordinateSpan(
        latitudeDelta: 0.05,
        longitudeDelta: 0.05)
        )

    var body: some View {
        VStack {
            Map(
            coordinateRegion: $region,
            interactionModes: .all,
            showsUserLocation: true,
            userTrackingMode: $userTrackingMode
            )
        }
    }
    func performSearch(item: String) {
        let searchRequest = MKLocalSearch.Request()
            searchRequest.naturalLanguageQuery = item
            searchRequest.region = region
            let search = MKLocalSearch(request: searchRequest)
        search.start { <#MKLocalSearch.Response?#>, <#Error?#> in
            <#code#>
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct Place: Identifiable {
    let id = UUID()
    let annotation: MKPointAnnotation
    let mapItem: MKMapItem
}
