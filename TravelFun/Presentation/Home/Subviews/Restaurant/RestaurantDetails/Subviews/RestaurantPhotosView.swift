//
//  RestaurantPhotosView.swift
//  TravelFun
//
//  Created by Ilhan Sari on 20/01/2023.
//

import SwiftUI

struct RestaurantPhotosView: View {
  var body: some View {
    ScrollView {
      LazyVGrid(columns: [GridItem(.fixed(120)),
                          GridItem(.fixed(120)),
                          GridItem(.fixed(120))], spacing: 5) {
        ForEach(0..<12) { _ in
          Image("billy")
            .resizable()
            .scaledToFill()
        }
      }
    }
    .navigationTitle("Photos")
    .navigationBarTitle("Photos", displayMode: .inline)
  }
}

struct RestaurantPhotosView_Previews: PreviewProvider {
    static var previews: some View {
      NavigationView {
        RestaurantPhotosView()
      }
    }
}
