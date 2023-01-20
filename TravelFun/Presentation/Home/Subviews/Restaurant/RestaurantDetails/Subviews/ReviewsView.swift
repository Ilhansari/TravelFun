//
//  ReviewsView.swift
//  TravelFun
//
//  Created by Ilhan Sari on 20/01/2023.
//

import SwiftUI

struct ReviewsView: View {

    let reviews: [Review]

    var body: some View {
      ScrollView(.vertical, showsIndicators: false) {
        VStack(alignment: .leading) {
          Text("Customers Reviews")
          .font(.system(size: 20, weight: .bold))
          .padding(.vertical, 12)

          ForEach(reviews, id: \.self) { review in

            HStack {
              AsyncImage(url: URL(string: review.user.profileImage)) { image in
                image
                  .resizable()
                  .scaledToFill()
                  .clipShape(Circle())
              } placeholder: {
                ProgressView()
              }
              .frame(width: 40, height: 40)

              VStack(alignment: .leading) {
                Text("\(review.user.firstName) \(review.user.lastName)")
                  .font(.system(size: 16, weight: .semibold))

                HStack(spacing: .zero) {
                  ForEach(0..<5) { index in

                    Image(systemName: "star.fill")
                      .foregroundColor(index < review.rating ? .yellow : .gray)
                      .scaledToFit()
                  }
                }
              }

              Spacer()

              Text("Dec 2023")
              .font(.system(size: 16, weight: .regular))
              .foregroundColor(Color.gray)

            }
            Text(review.text)
            .font(.system(size: 14, weight: .regular))
          }
        }
      }
    }
}

struct ReviewsView_Previews: PreviewProvider {
    static var previews: some View {
      ReviewsView(reviews: [.init(user: .init(id: 0, username: "Adam", firstName: "Any", lastName: "Angelo", profileImage: "billy"), rating: 4, text: "It is a pencil.")])
    }
}
