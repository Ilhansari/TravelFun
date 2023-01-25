//
//  UserDetailsView.swift
//  TravelFun
//
//  Created by Ilhan Sari on 24/01/2023.
//

import SwiftUI

struct UserDetailsView: View {

  let user: User

  var body: some View {
    ScrollView {
      VStack(spacing: 10) {
        Image(user.imageName)
          .resizable()
          .scaledToFill()
          .clipped()
          .frame(width: 100, height: 100)
          .cornerRadius(60)
          .shadow(radius: 10)

        Text(user.name)
          .font(.system(size: 16, weight: .bold))
          .multilineTextAlignment(.center)

        Text("@amyadams20 - 👍🏿 2541")
          .font(.system(size: 12, weight: .regular))
          .multilineTextAlignment(.center)

        Text("Youtuber, Vlogger, Travel Creator")
          .font(.system(size: 12, weight: .regular))
          .foregroundColor(.gray)
          .multilineTextAlignment(.center)

        HStack {
          VStack {
            Text("59,394")
              .font(.system(size: 16, weight: .bold))
              .multilineTextAlignment(.center)

            Text("Followers")
              .font(.system(size: 12, weight: .regular))
              .foregroundColor(.gray)
              .multilineTextAlignment(.center)
          }
          Text(" | ")
            .font(.system(size: 24, weight: .regular))
            .foregroundColor(.gray)
            .multilineTextAlignment(.center)

          VStack {
            Text("2,112")
              .font(.system(size: 16, weight: .bold))
              .multilineTextAlignment(.center)

            Text("Following")
              .font(.system(size: 12, weight: .regular))
              .foregroundColor(.gray)
              .multilineTextAlignment(.center)
          }
        }

        HStack(spacing: 10) {
          Group {
            Button { } label: {
              HStack {
                Spacer()
                Text("Follow")
                  .font(.system(size: 12, weight: .semibold))
                  .foregroundColor(.white)
                  Spacer()
              }
              .padding(.vertical, 8)
              .background(.orange)
              .cornerRadius(100)

            }

            Button { } label: {
              HStack {
                Spacer()
                Text("Contact")
                  .font(.system(size: 12, weight: .semibold))
                  .foregroundColor(.black)
                  Spacer()
              }
              .padding(.vertical, 8)
              .background(Color.init(white: 0.6))
              .cornerRadius(100)
            }
          }
        }
        .padding()

        ForEach(0..<10) { _ in

          VStack(alignment: .leading) {
            Image("tapas")
              .resizable()
              .scaledToFill()

            HStack {
              Image("billy")
                .resizable()
                .scaledToFit()
                .frame(height: 34)
                .clipShape(Circle())

              VStack(alignment: .leading) {
                Text("Test post text here for preview to see...")
                  .font(.system(size: 13, weight: .bold))
                  .foregroundColor(.black)

                Text("500k views")
                  .font(.system(size: 12, weight: .semibold))
                  .foregroundColor(.gray)
              }

            }
            .padding(.horizontal, 8)

            HStack(spacing: 5) {
              ForEach(0..<3) { _ in
                Text("#Travelling")
                  .font(.system(size: 12, weight: .semibold))
                  .foregroundColor(.white)
                  .background(Color(.systemBlue))
                  .cornerRadius(20)
              }
            }
            .padding(.horizontal, 8)
            .padding(.bottom, 8)
          }

          .background(Color.white)
          .cornerRadius(12)
          .padding()
          .shadow(color: .init(white: 0.8), radius: 5, x: 0, y: 4)
        }
      }
    }
    .navigationTitle(user.name)
    .navigationBarTitle(user.name, displayMode: .inline)
  }
}

struct UserDetailsView_Previews: PreviewProvider {
    static var previews: some View {
      UserDetailsView(user: .init(imageName: "billy", name: "Billy Adams"))
    }
}
