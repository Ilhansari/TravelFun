//
//  ActivityIndicatorView.swift
//  TravelFun
//
//  Created by Ilhan Sari on 10/01/2023.
//

import SwiftUI


struct ActivityIndicatorView: UIViewRepresentable {
  typealias UIViewType = UIActivityIndicatorView

  func makeUIView(context: Context) -> UIActivityIndicatorView {
    let activityIndicator = UIActivityIndicatorView(style: .large)
    activityIndicator.startAnimating()
    activityIndicator.color = .white
    return activityIndicator
  }

  func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) { }
}
