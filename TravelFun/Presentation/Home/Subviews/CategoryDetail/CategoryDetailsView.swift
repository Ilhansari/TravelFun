//
//  CategoryDetailsView.swift
//  TravelFun
//
//  Created by Ilhan Sari on 09/01/2023.
//

import SwiftUI

struct CategoryDetailsView: View {

  @ObservedObject private var viewModel = CategoryDetailsViewModel()

  var body: some View {
    ZStack {
      if viewModel.isLoading {
        ActivityIndicator()
      } else {
        ScrollView {
          ForEach(viewModel.categories, id: \.self) { categoryDetail in
            VStack(alignment: .leading) {
              Image(categoryDetail.imageName)
                .resizable()
                .scaledToFill()
              Text(categoryDetail.name)
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
    CategoryDetailsView()
  }
}
