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
      VStack(spacing: 12) {
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
              .background(.gray)
              .cornerRadius(100)

            }
          }

        }
        .padding()

        ForEach(0..<5) { _ in
          Image("tapas")
            .resizable()
            .scaledToFill()
            .clipped()
            .cornerRadius(5)
            .padding(.horizontal)
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
