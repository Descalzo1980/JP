//
//  PredatorMap.swift
//  JurassicPark
//
//  Created by Станислав Леонов on 19.08.2025.
//

import SwiftUI
import MapKit

struct PredatorMap: View {
    let predators = Predators()
    
    @State var position: MapCameraPosition = .automatic
    @State var satellite = false
    
    var body: some View {
        Map(position: $position) {
            ForEach(predators.apexPredators) { predator in
                Annotation(predator.name, coordinate: predator.location) {
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                        .shadow(color: .white, radius: 3)
                        .scaleEffect(x: -1)
                }
            }
        }
        .mapStyle(satellite ? .imagery(elevation: .realistic) : .standard(elevation: .realistic))
        .overlay(alignment: .bottomTrailing) {
            Button {
                satellite.toggle()
            } label: {
                Image(systemName: satellite ? "globe.central.south.asia.fill" : "globe.central.south.asia")
                    .font(.largeTitle)
                    .imageScale(.large)
                    .padding(3)
                    .background(.ultraThinMaterial)
                    .clipShape(.rect(cornerRadius: 7))
                    .shadow(radius: 3)
                    .padding()
            }
        }
        .toolbarBackground(.automatic)
//        .onAppear {
//            position = .camera(MapCamera(centerCoordinate: CLLocationCoordinate2D(latitude: 59.9343, longitude: 30.3351), distance: 100,heading: 250,
//                                         pitch: 0))
//        }
    }
}

#Preview {
    let predator = Predators().apexPredators[7]
    
    PredatorMap(position: .camera(
        MapCamera(
            centerCoordinate:
                Predators().apexPredators[2].location,
            distance: 1000,
            heading: 250,
            pitch: 70
            )
        )
    )
    .preferredColorScheme(.dark)
}
