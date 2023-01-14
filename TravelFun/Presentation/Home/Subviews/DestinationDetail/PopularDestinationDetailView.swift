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
  @State var isShowAttractions: Bool = true


  let attractions: [Attraction] = [
    .init(name: "Eiffel Tower", latitude: 48.859565, longitude: 2.35),
    .init(name: "Champs", latitude: 48.866867, longitude: 2.311780),
    .init(name: "Louvre", latitude: 48.860288, longitude: 2.337789)
  ]

  init(destination: Destination) {
    self.destination = destination
    self._region = State(initialValue: MKCoordinateRegion(center: .init(latitude: destination.latitude,
                                                                       longitude: destination.longitude),
                                                          span: .init(latitudeDelta: 0.1, longitudeDelta: 0.1)))
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
          Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown.")
            .padding(.top, 4)

          HStack {
            Text("Location")
              .font(.system(size: 16, weight: .semibold))
            Spacer()
            Button {
              isShowAttractions.toggle()
            } label: {
              Text("\(isShowAttractions ? "Hide" : "Show") attractions")
                .font(.system(size: 16, weight: .semibold))
            }
            Toggle("Toggle", isOn: $isShowAttractions)
              .labelsHidden()
          }
          .padding(.top, 4)

          Map(coordinateRegion: $region,
              annotationItems: isShowAttractions ? attractions : [])
              { attraction in
                MapMarker(coordinate: .init(latitude: attraction.latitude,
                                            longitude: attraction.longitude),
                          tint: .red)
          }
            .frame(height: 350)
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
                                                    imageName: "eiffel_tower", latitude: 48.8566, longitude: 2.3522))
  }
}
