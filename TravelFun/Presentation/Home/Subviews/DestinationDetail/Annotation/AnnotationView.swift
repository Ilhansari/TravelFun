//
//  AnnotationView.swift
//  TravelFun
//
//  Created by Ilhan Sari on 14/01/2023.
//

import SwiftUI

struct AnnotationView: View {

  let attraction: Attraction

  var body: some View {
    VStack(spacing: 8) {
      Image(attraction.imageName)
        .resizable()
        .frame(width: 100, height: 60)
        .cornerRadius(4)
      LinearGradient(gradient: Gradient(colors: [.red, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
          .frame(width: 95, height: 30)
          .cornerRadius(4)
          .overlay(
            Text(attraction.name)
                  .foregroundColor(.white)
      )
    }
  }
}

struct AnnotationView_Previews: PreviewProvider {
  static var previews: some View {
    AnnotationView(attraction: .init(imageName: "eiffel_tower", name: "Eiffel Tower", latitude: 48.859565, longitude: 2.35))
  }
}
