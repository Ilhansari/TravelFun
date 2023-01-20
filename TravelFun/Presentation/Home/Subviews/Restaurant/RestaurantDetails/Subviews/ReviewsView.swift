//
//  ReviewsView.swift
//  TravelFun
//
//  Created by Ilhan Sari on 20/01/2023.
//

import SwiftUI

struct ReviewsView: View {
    var body: some View {
      ScrollView(.vertical, showsIndicators: false) {
        VStack(alignment: .leading) {
          Text("Customers Reviews")
          .font(.system(size: 20, weight: .bold))
          .padding(.vertical, 12)

          ForEach(0..<5) { _ in

            HStack {
              Image("billy")
                .resizable()
                .scaledToFill()
                .frame(width: 40.0, height: 40.0)
                .clipShape(Circle())

              VStack(alignment: .leading) {
                Text("Amy Adams")
                .font(.system(size: 16, weight: .semibold))

                HStack(spacing: .zero) {
                  ForEach(0..<5) { _ in
                    Image(systemName: "star.fill")
                      .foregroundColor(.yellow)
                      .scaledToFit()
                  }
                }
              }

              Spacer()

              Text("Dec 2023")
              .font(.system(size: 16, weight: .regular))
              .foregroundColor(Color.gray)

            }
            Text("They are always here on time, never leave early and adhere to all company break times.")
            .font(.system(size: 14, weight: .regular))
          }
        }
      }
    }
}

struct ReviewsView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewsView()
    }
}
