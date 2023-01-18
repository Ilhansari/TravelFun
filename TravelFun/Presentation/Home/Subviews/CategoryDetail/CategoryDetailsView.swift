//
//  CategoryDetailsView.swift
//  TravelFun
//
//  Created by Ilhan Sari on 09/01/2023.
//

import SwiftUI

struct CategoryDetailsView: View {

  @ObservedObject private var viewModel: CategoryDetailsViewModel

  init(name: String) {
    self.viewModel = .init(name: name)
  }

  var body: some View {
    ZStack {
      if viewModel.isLoading {
        ActivityIndicator()
      } else {
        ScrollView {
          ForEach(viewModel.categories, id: \.self) { category in
            VStack(alignment: .leading) {
              AsyncImage(url: URL(string: category.thumbnail)) { image in
                image
                  .resizable()
                  .scaledToFill()
              } placeholder: {
                ProgressView()
              }

              Text(category.name)
                .font(.system(size: 14, weight: .semibold))
                .padding()
            }
            .asTile()
            .padding()
          }
        }
      }
    }
    .navigationBarTitle("Category", displayMode: .inline)
  }
}

struct CategoryDetailsView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      CategoryDetailsView(name: "Art")
    }
  }
}
