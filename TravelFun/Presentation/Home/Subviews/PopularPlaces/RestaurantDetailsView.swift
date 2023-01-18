//
//  RestaurantDetailsView.swift
//  TravelFun
//
//  Created by Ilhan Sari on 17/01/2023.
//

import SwiftUI

struct RestaurantDetails: Codable {
    let description: String
    let popularDishes: [Dish]
}

struct Dish: Codable, Hashable {
    let name, price, photo: String
    let numPhotos: Int
}


class RestaurantDetailsViewModel: ObservableObject {

  @Published var isLoading: Bool = true
  @Published var errorMessage: String = ""
  @Published var restaurantDetails: RestaurantDetails?

  init(id: Int) {

    let url = URL(string: "https://travel.letsbuildthatapp.com/travel_discovery/restaurant?id=\(id)")
    guard let url = url else { return }

    URLSession.shared.dataTask(with: url) { (data, response, error) in
      DispatchQueue.main.asyncAfter(deadline: .now() + 1) {

        guard let data = data else { return }

        do {
          self.restaurantDetails = try JSONDecoder().decode(RestaurantDetails.self, from: data)
        } catch {
          print("Failed to decode JSON:", error)
          self.errorMessage = error.localizedDescription
        }
        self.isLoading = false
      }
    }
    .resume()
  }
}

struct RestaurantDetailsView: View {

  @ObservedObject var viewModel: RestaurantDetailsViewModel

  init(id: Int) {
    self.viewModel = .init(id: id)
  }

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

          Text(viewModel.restaurantDetails?.description ?? "")
            .font(.system(size: 12, weight: .regular))

          Text("Popular Dishes")
            .font(.system(size: 16, weight: .semibold))

          ScrollView(.horizontal, showsIndicators: false) {
            HStack {
              ForEach(viewModel.restaurantDetails?.popularDishes ?? [], id: \.self) { dish in
                VStack(alignment: .leading, spacing: .zero) {

                  AsyncImage(url: URL(string: dish.photo)) { image in
                    image
                      .resizable()
                      .scaledToFill()
                  } placeholder: {
                    ProgressView()
                  }
                  .frame(width: 80, height: 80)

                  Group {
                    Text(dish.name)
                      .font(.system(size: 12, weight: .bold))
                      .foregroundColor(.black)

                    Text("\(dish.numPhotos) Photos")
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
      RestaurantDetailsView(id: 0)
    }
}
