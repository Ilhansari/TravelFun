//
//  DiscoverCategoriesView.swift
//  TravelFun
//
//  Created by Ilhan Sari on 08/01/2023.
//

import SwiftUI

struct DiscoverCategoriesView: View {

  private let categories: [Category] = [
    Category(name: "Art", imageName: "paintpalette.fill"),
    Category(name: "Sports", imageName: "sportscourt.fill"),
    Category(name: "Live Events", imageName: "pencil"),
    Category(name: "Food", imageName: "scribble.variable"),
    Category(name: "History", imageName: "music.mic"),
  ]

  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(alignment: .top, spacing: 8) {
        ForEach(categories, id: \.self) { category in
          NavigationLink {
            CategoryDetailsView(name: category.name)
          } label: {
            VStack(spacing: 4) {
              Image(systemName: category.imageName)
                .frame(width: 64, height: 64)
                .foregroundColor(Color(#colorLiteral(red: 1, green: 0.6967965364, blue: 0.2615769506, alpha: 1)))
                .background(Color(.init(white: 0.9, alpha: 1)))
                .cornerRadius(32)
                .shadow(color: .gray, radius: 4, x: 0.0, y: 2)
              Text(category.name)
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
            }
            .frame(width: 70)
          }

        }
      }.padding(.horizontal)
    }
  }
}

struct DiscoverCategoriesView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      HomeView()
    }
  }
}
