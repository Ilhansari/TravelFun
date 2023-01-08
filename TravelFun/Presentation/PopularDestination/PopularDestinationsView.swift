//
//  PopularDestinationsView.swift
//  TravelFun
//
//  Created by Ilhan Sari on 08/01/2023.
//

import SwiftUI

struct Destination: Hashable {
  let country, city, imageName: String
}

struct PopularDestinationsView: View {

  private let destinations: [Destination] = [
    .init(country: "France", city: "Paris", imageName: "eiffel_tower"),
    .init(country: "Japan", city: "Tokyo", imageName: "japan"),
    .init(country: "USA", city: "NewYork", imageName: "new_york"),
    .init(country: "France", city: "Paris", imageName: "eiffel_tower")
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
                Text(destination.country)
                  .font(.system(size: 12, weight: .semibold))
                  .padding(.bottom, 8)
                  .foregroundColor(.gray)
              }
              .padding(.horizontal, 12)

            }
            .background(Color(.init(white: 0.9, alpha: 1)))
            .cornerRadius(5)
            .shadow(color: .gray, radius: 4, x: 0.0, y: 2)
          }
        }
        .padding(.horizontal)
      }
    }
  }
}


struct PopularDestinationsView_Previews: PreviewProvider {
    static var previews: some View {
        PopularDestinationsView()
    }
}
