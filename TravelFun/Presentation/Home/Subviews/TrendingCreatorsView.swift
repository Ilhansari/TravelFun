//
//  TrendingCreators.swift
//  TravelFun
//
//  Created by Ilhan Sari on 08/01/2023.
//

import SwiftUI

struct User: Hashable {
  let imageName, name: String
}

struct TrendingCreatorsView: View {

  let users: [User] = [
    User(imageName: "billy", name: "Billy John"),
    User(imageName: "amy", name: "Amy Adam"),
    User(imageName: "sam", name: "Sam")
  ]

  var body: some View {
    VStack {
      HStack {
        Text("Trending Creators")
          .font(.system(size: 14, weight: .semibold))
        Spacer()
        Text("see all")
          .font(.system(size: 14, weight: .semibold))
      }
      .padding(.horizontal)
      .padding(.top)
      ScrollView(.horizontal, showsIndicators: false) {
        HStack {
          ForEach(users, id: \.self) { user in
            VStack(spacing: 4) {
              Image(user.imageName)
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 60, height: 60)
                .cornerRadius(60)
                .shadow(color: .gray, radius: 4, x: 0.0, y: 2)
              Text(user.name)
                .font(.system(size: 11, weight: .semibold))
                .multilineTextAlignment(.center)
            }
          }
        }
        .padding(.horizontal)
      }
    }
  }
}

struct TrendingCreators_Previews: PreviewProvider {
    static var previews: some View {
      TrendingCreatorsView()
    }
}
