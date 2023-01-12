//
//  PopularDestinationsView.swift
//  TravelFun
//
//  Created by Ilhan Sari on 08/01/2023.
//

import SwiftUI

struct PopularDestinationsView: View {

  private let destinations: [Destination] = [
    .init(country: "France", city: "Paris", imageName: "eiffel_tower"),
    .init(country: "Japan", city: "Tokyo", imageName: "japan"),
    .init(country: "USA", city: "NewYork", imageName: "new_york"),
    .init(country: "Netherlands", city: "Rotterdam", imageName: "eiffel_tower")
  ]
  var body: some View {
    VStack {
      HStack {
        Text("Popular destinations")
          .font(.system(size: 14, weight: .semibold))
        Spacer()
        Text("see all")
          .font(.system(size: 14, weight: .semibold))
      }
      .padding(.horizontal)
      .padding(.top)
      ScrollView(.horizontal, showsIndicators: false) {
        HStack {
          ForEach(destinations, id: \.self) { destination in
            NavigationLink {
              PopularDestinationDetailView(destination: destination)
            } label: {
              PopularDestinationTile(destination: destination)
            }

          }
        }
        .padding(.horizontal)
      }
    }
  }
}

struct PopularDestinationTile: View {

  let destination: Destination

  var body: some View {
    VStack(alignment: .leading, spacing: .zero) {

      Image(destination.imageName)
        .resizable()
        .scaledToFill()
        .frame(width: 125, height: 125)
        .cornerRadius(4)
        .padding(.horizontal, 6)
        .padding(.vertical, 6)

      Group {
        Text(destination.city)
          .font(.system(size: 12, weight: .semibold))
          .foregroundColor(.black)
        Text(destination.country)
          .font(.system(size: 12, weight: .semibold))
          .padding(.bottom, 8)
          .foregroundColor(.gray)
      }
      .padding(.horizontal, 12)

    }
    .asTile()
  }
}

struct PopularDestinationsView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      PopularDestinationsView()
    }
  }
}
