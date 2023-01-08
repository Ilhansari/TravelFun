//
//  PopularPlacesView.swift
//  TravelFun
//
//  Created by Ilhan Sari on 08/01/2023.
//

import SwiftUI

struct Restaurant: Hashable {
  let restaurantName, score, foodImageName, foodName, currency, city, country: String
}

struct PopularPlacesView: View {

  let restaurants: [Restaurant] = [
      Restaurant(restaurantName: "La Boheme",
                   score: "4.5",
                   foodImageName: "amy",
                   foodName: "Pizza",
                   currency: "EUR",
                   city: "Paris",
                   country: "France"),
      Restaurant(restaurantName: "Taco Bell",
                   score: "3.0",
                   foodImageName: "bar_grill",
                   foodName: "Taco",
                   currency: "USD",
                   city: "Los Angeles",
                   country: "United States"),
      Restaurant(restaurantName: "McDonald's", score: "2.5", foodImageName: "billy", foodName: "Hamburger", currency: "USD", city: "New York", country: "United States"),
      Restaurant(restaurantName: "KFC", score: "3.5", foodImageName: "sam", foodName: "Fried chicken", currency: "USD", city: "London", country: "United Kingdom"),
      Restaurant(restaurantName: "Sushi Zanmai", score: "4.0", foodImageName: "tapas", foodName: "Sushi", currency: "JPY", city: "Tokyo", country: "Japan")
  ]

  var body: some View {
    VStack {
      HStack {
        Text("Popular places to eat")
          .font(.system(size: 14, weight: .semibold))
        Spacer()
        Text("see all")
          .font(.system(size: 14, weight: .semibold))
      }
      .padding(.horizontal)
      .padding(.top)
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 8.0) {
          ForEach(restaurants, id: \.self) { restaurant in
            VStack(spacing: 6) {
              HStack {
                Image(restaurant.foodImageName)
                  .resizable()
                  .scaledToFill()
                  .frame(width: 60, height: 60)
                  .clipped()
                  .cornerRadius(4)
                  .padding(.horizontal, 6)

                VStack(alignment: .leading, spacing: 6) {
                  HStack {
                    Text(restaurant.restaurantName)
                      .font(.system(size: 10, weight: .semibold))
                    Spacer()
                    Button(action: { }) {
                      Image(systemName: "ellipsis")
                        .foregroundColor(.gray)
                    }
                  }

                  Text("★ \(restaurant.score) - \(restaurant.foodName) - \(restaurant.currency)")
                    .font(.system(size: 10, weight: .semibold))

                  Text("\(restaurant.city), \(restaurant.country)")
                    .font(.system(size: 10, weight: .semibold))

                  Spacer()
                }
                .padding(.top, 6)

                Spacer()
              }
              .frame(width: 230, height: 75)
              .background(Color(.init(white: 0.9, alpha: 1)))
              .cornerRadius(5)
              .shadow(color: .gray, radius: 4, x: 0.0, y: 2)
            }
          }
        }
        .padding(.horizontal)
      }
    }
  }
}


struct PopularPlacesView_Previews: PreviewProvider {
    static var previews: some View {
        PopularPlacesView()
    }
}