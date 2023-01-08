//
//  ContentView.swift
//  TravelFun
//
//  Created by Ilhan Sari on 08/01/2023.
//

import SwiftUI

struct ContentView: View {

  init() {
    UINavigationBar.appearance().largeTitleTextAttributes = [
      .foregroundColor: UIColor.white
    ]
  }

  var body: some View {
    NavigationView {
      HomeView()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
