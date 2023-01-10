//
//  ActivityIndicator.swift
//  TravelFun
//
//  Created by Ilhan Sari on 10/01/2023.
//

import SwiftUI

struct ActivityIndicator: View {

  var body: some View {
    VStack(alignment: .center) {
      ActivityIndicatorView()
      Text("Loading...")
        .foregroundColor(.white)
        .font(.system(size: 16, weight: .semibold))
    }
    .padding()
    .background(Color.black)
    .cornerRadius(8)
  }
}

struct ActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicator()
    }
}
