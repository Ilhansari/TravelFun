//
//  HeaderDestinationContainer.swift
//  TravelFun
//
//  Created by Ilhan Sari on 14/01/2023.
//

import SwiftUI
import UIKit

struct HeaderDestinationContainer: UIViewControllerRepresentable {

  let imageURLStrings: [String]

  func makeUIViewController(context: Context) -> UIViewController {
    let pageVC = CustomPageViewController(imageURLStrings: imageURLStrings)
    return pageVC
  }

  typealias UIViewControllerType = UIViewController

  func updateUIViewController(_ uiViewController: UIViewController, context: Context) { }
}

struct HeaderDestinationContainer_Previews: PreviewProvider {
  static var previews: some View {
    HeaderDestinationContainer(imageURLStrings: [
      "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/7156c3c6-945e-4284-a796-915afdc158b5",
      "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/b1642068-5624-41cf-83f1-3f6dff8c1702", "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/6982cc9d-3104-4a54-98d7-45ee5d117531", "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/2240d474-2237-4cd3-9919-562cd1bb439e"
    ])
  }
}
