//
//  CategoryDetailsView.swift
//  TravelFun
//
//  Created by Ilhan Sari on 09/01/2023.
//

import SwiftUI

struct CategoryDetailsView: View {

  private let categoryDetails: [CategoryDetail] = [
    CategoryDetail(name: "Art", imageName: "art1"),
    CategoryDetail(name: "Sport", imageName: "art2"),
  ]

  var body: some View {
    ScrollView {
      ForEach(categoryDetails, id: \.self) { categoryDetail in
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
    .navigationBarTitle("Category", displayMode: .inline)
  }
}

struct CategoryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryDetailsView()
    }
}
