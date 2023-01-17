//
//  RestaurantDetailsView.swift
//  TravelFun
//
//  Created by Ilhan Sari on 17/01/2023.
//

import SwiftUI

struct RestaurantDetailsView: View {

    var body: some View {
      ScrollView {
        ZStack(alignment: .bottomLeading) {
          Image("tapas")
            .resizable()
            .scaledToFill()

          HStack {
            VStack(alignment: .leading) {

              Text("Japan's Finest Tapas")
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(.white)
                .fixedSize()

              HStack(spacing: .zero) {
                ForEach(0..<5) { _ in
                  Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                }
              }
            }

            Spacer()

            Text("See more photos")
              .font(.system(size: 14, weight: .semibold))
              .foregroundColor(.white)
          }
          .padding(.horizontal, 8)
          .padding(.bottom, 8)
        }

        VStack(alignment: .leading, spacing: 12) {

          Text("Location & Description")
            .font(.system(size: 16, weight: .semibold))

          Text("Tokyo, Japan")
            .font(.system(size: 12, weight: .semibold))

          HStack(spacing: .zero) {
            ForEach(0..<3) { _ in
              Image(systemName: "dollarsign.circle.fill")
                .foregroundColor(.yellow)
            }
          }

          Text("Experience the taste of authentic Italian cuisine at our charming restaurant. With a cozy outdoor seating area and a menu featuring fresh pasta, wood-fired pizzas, and a wide selection of wine. Open for lunch and dinner, we are the perfect spot for a romantic dinner or a casual family meal.")
            .font(.system(size: 12, weight: .regular))

          Text("Popular Dishes")
            .font(.system(size: 16, weight: .semibold))

          ScrollView(.horizontal, showsIndicators: false) {
            HStack {
              ForEach(PopularPlacesView.restaurants, id: \.self) { destination in
                VStack(alignment: .leading, spacing: .zero) {

                  Image("tapas")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 80)
                    .cornerRadius(5)
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray))
                    .shadow(radius: 2)
                    .padding(.vertical, 2)

                  Group {
                    Text(destination.city)
                      .font(.system(size: 12, weight: .bold))
                      .foregroundColor(.black)

                    Text("88 photos")
                      .font(.system(size: 12, weight: .regular))
                      .padding(.bottom, 8)
                      .foregroundColor(.gray)
                  }
                }
                .asTile()
              }
            }
          }
        }
        .padding(.horizontal, 12)

      }
      .navigationTitle("Restaurant Details")
      .navigationBarTitle("Restaurant Details", displayMode: .inline)
    }
}

struct RestaurantDetailsView_Previews: PreviewProvider {
    static var previews: some View {
      RestaurantDetailsView()
    }
}
