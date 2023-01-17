//
//  HomeView.swift
//  TravelFun
//
//  Created by Ilhan Sari on 08/01/2023.
//

import SwiftUI

struct HomeView: View {

  init() {
    UINavigationBar.appearance().largeTitleTextAttributes = [
      .foregroundColor: UIColor.white
    ]
  }
  
  var body: some View {
    ZStack {

      LinearGradient(colors: [Color(#colorLiteral(red: 1, green: 0.6967965364, blue: 0.2615769506, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.5921096206, blue: 0.2459464371, alpha: 1))],
                     startPoint: .center,
                     endPoint: .bottom)
      .ignoresSafeArea()

      Color.homeBackground
        .offset(y: 400)

      ScrollView {

        TextFieldView()

        DiscoverCategoriesView()

        VStack {
          
          PopularDestinationsView()

          PopularPlacesView()

          TrendingCreatorsView()
        }
        .background(Color.homeBackground)
        .cornerRadius(16)
        .padding(.top, 32)

      }
    }
    .navigationTitle("Discover")
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      HomeView()
    }
  }
}

struct TextFieldView: View {

  var body: some View {
    HStack() {
      Image(systemName: "magnifyingglass")
        .foregroundColor(Color.white)
      Text("Where do you want go?")
      Spacer()
    }
    .font(.system(size: 14, weight: .semibold))
    .foregroundColor(.white)
    .padding()
    .background(Color(.init(white: 0.95, alpha: 0.3)))
    .cornerRadius(12)
    .padding(16)

  }
}
