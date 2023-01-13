//
//  PopularDestinationDetailView.swift
//  TravelFun
//
//  Created by Ilhan Sari on 12/01/2023.
//

import SwiftUI
import MapKit

struct PopularDestinationDetailView: View {

  let destination: Destination

  @State var region: MKCoordinateRegion

  init(destination: Destination) {
    self.destination = destination
    self._region = State(initialValue: MKCoordinateRegion(center: .init(latitude: destination.latitude,
                                                                       longitude: destination.longitude),
                                                         latitudinalMeters: 0.1,
                                                         longitudinalMeters: 0.1))
  }

  var body: some View {
    ScrollView {
      VStack(alignment: .leading) {
        Image(destination.imageName)
          .resizable()
          .scaledToFill()
          .frame(height: 200)
          .clipped()

        Group {
          Text(destination.city)
            .font(.system(size: 16, weight: .semibold))
          Text(destination.country)
            .font(.system(size: 14, weight: .regular))

          HStack(spacing: .zero) {
            ForEach(0..<5) { _ in
              Image(systemName: "star.fill")
                .foregroundColor(.yellow)
            }
          }
          .padding(.top, 2)
          Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
            .padding(.top, 4)

          HStack {
            Text("Location")
              .font(.system(size: 16, weight: .semibold))
          }
          .padding(.top, 4)

          Map(coordinateRegion: $region)
            .frame(height: 250)

        }
        .padding(.horizontal, 12)
      }
    }
    .navigationBarTitle("Destination", displayMode: .inline)
  }
}

struct PopularDestinationDetailView_Previews: PreviewProvider {
  static var previews: some View {
    PopularDestinationDetailView(destination: .init(country: "Paris",
                                                    city: "France",
                                                    imageName: "eiffel_tower", latitude: 48.0,
                                                    longitude: 37.0))
  }
}
